/*
    index.js
    lastmodified time:2021/01/14T8:47
    author:pan
 */

const {ipcRenderer,remote } = require('electron')
const {dialog,app} = require('electron').remote

// 当前的可执行文件所在目录
let appPath = app.getPath('exe')
// 获取上一层的目录 app 是当前目录名称 须要给去掉
let exePath = appPath.replace(/\\app\\studio.exe/, '')

let currentFile = null; //当前文档保存的路径
let isSaved = true;     //当前文档是否已保存,默认为已保存
let txtEditor = document.getElementById('text_edit_area');
let lineEditor=document.getElementById('line_edit_area');
let saveFileAsFlag=false;//文件另存为标记
let oninput_flag=false;

document.title = "Untitled"; //设置文档标题，影响窗口标题栏名称

//监听与主进程的通信
ipcRenderer.on('init_open_file',(event,arg) => {
    if(currentFile==null){
    currentFile=arg;
    console.log("init_open_file");
    console.log(arg);
    open_file();
    isSaved=false;
    }
})

ipcRenderer.on('file_action', (event, arg) => {
    switch(arg){        
    case 'new_file': //新建文件
        askSaveIfNeed();
        currentFile=null;
        console.log("new_file");
        isSaved=false;
        break;
    case 'open_file': //打开文件
        askSaveIfNeed();
        console.log("open_file");
        open_file();
        isSaved=false;
        break;
    case 'open_folder': //打开文件夹
        askSaveIfNeed();
        console.log("open_folder");
        open_folder();
        isSaved=false;
        break;
    case 'save_file': //保存文件
        saveCurrentDoc();
        console.log("save_file");
        isSaved=true;
        break;
    case 'save_file_as': //另存为
        saveFileAsFlag=true;
        saveCurrentDoc();
        console.log("save_file_as");
        saveFileAsFlag=false;
        break;
    case 'exit'://退出程序
        askSaveIfNeed();
        console.log("exit electron app!");
        ipcRenderer.sendSync('exit', 'exit');
        break;
    }
});

//监听主进程发来的编译命令
ipcRenderer.on('compile_action',(event,arg)=>{
    
    switch(arg){   
        case 'gen_tokens':
            console.log("gen_tokens!");
            gen_tokens();
            break;
        case 'clear_gen_files':
            console.log("clear_gen_files!");
            clear_gen_files();
            break;
        case 'gen_middle_code':
            console.log("gen_middle_code!");
            gen_middle_code();
            break;
        case 'gen_coe':
            console.log("gen_coe!");
            gen_coe();
            break;
        case 'gen_asm':
            console.log("gen_asm!");
            gen_asm();
            break;
        case 'compile_current_code':
            console.log("compile_current_code!");
            compile_current_code();
            break;
    }
    
});


//监听文字修改和输入
txtEditor.oninput=(e)=>{
    oninput_flag=true;

    if(isSaved) document.title += " *";
    isSaved=false;
};

  
// 按时刷新文本区域并重新上色
 window.setInterval(rerender_on_change,200)


function rerender_on_change(){
    //只有有输入时才重新刷新文本显示界面
    if(oninput_flag==true&&is_c_file_flag==true)
    {
        current_audio_rad_count+=5;
        //播放程序员鼓励音频
        random_play_audio();

        oninput_flag=false;
        //sleep(300);

        //刷新前要先记录光标位置
        var selection = window.getSelection();
        //获取原来的光标
        var lastEditRange = selection.getRangeAt(0);
        //如果是选中而不是光标状态就不进行更新
        if(lastEditRange.collapsed==false){
            oninput_flag=true;
            //console.log("!!!!!!!!!!");
            return;
        }
        //获取原来光标的父亲元素
        var lastEditRangeNode=lastEditRange.endContainer.parentElement;
        //获取那个元素的id
        var lastEditRangeNode_id=lastEditRangeNode.id;
        var lastEditRange_start=lastEditRange.startOffset;
        var lastEditRange_end=lastEditRange.endOffset;
        var new_range = new Range();

        // console.log(selection);
        // console.log(lastEditRange);
        // console.log(lastEditRange.endContainer);
        // console.log(lastEditRangeNode);
        // console.log(lastEditRangeNode_id);
        // console.log(lastEditRange_start,lastEditRange_end);


        // 考虑到div内的可编辑文本区域按回车换行之后会新出现div的问题
        var last=txtEditor.children.length;
        var last_child_tag_name=txtEditor.children[last-1].tagName;
        var last_font_id=new Number(txtEditor.children[last-2].id);
    
        if(last_child_tag_name=="DIV"){
            const div_text=txtEditor.children[last-1].innerText;
            //console.log(txtEditor.children[last-1]);
            //console.log(div_text);
            save_text_editor_to_txt_save(true,last_font_id,div_text);
            //刷新显示区域
            load_text_to_textarea();

            //console.log(last)
            //console.log(txtEditor.children);
            //console.log(txtEditor.children[last]);

            //lastEditRangeNode_new=txtEditor.children[last];

            //刷新完成后回复光标位置
            //先清除所有光标
            selection.removeAllRanges();
            
            var lastEditRangeNode_new=txtEditor.children[last-1];
            //console.log(lastEditRangeNode_new);
        
            new_range.setStart(lastEditRangeNode_new,0);
            new_range.setEnd(lastEditRangeNode_new,0);
            selection.addRange(new_range);
            //console.log(new_range);
            //console.log(selection);
            
        }
        else{
            save_text_editor_to_txt_save(false,0,null);

            //刷新显示区域
            load_text_to_textarea();

            //刷新完成后回复光标位置
            //先清除所有光标
            selection.removeAllRanges();
            var lastEditRangeNode_new=document.getElementById(lastEditRangeNode_id);
            //console.log(lastEditRangeNode_new);
        
            //特殊情况处理
            if(!lastEditRangeNode_new){
            //如果获得的是一个不存在的标签号
            //找到存在的最近的标签号
            var temp_num= new Number(lastEditRangeNode_id);
            while(!lastEditRangeNode_new&&temp_num>0){
                temp_num--;
                lastEditRangeNode_new=document.getElementById(temp_num.toString());
            }
            if(temp_num==0)
            {
                console.log("wrong with finding range!");
            }
            }
            //正常情况下
            if(lastEditRangeNode_new){
            if(lastEditRangeNode_new.firstChild.length<lastEditRange_start)
            {
                var temp_num= new Number(lastEditRangeNode_id);
                temp_num++;
                lastEditRangeNode_new=document.getElementById(temp_num.toString());
                lastEditRange_start=1;
                lastEditRange_end=1;
            }
            
            //console.log(lastEditRangeNode_new);
            new_range.setStart(lastEditRangeNode_new.firstChild,lastEditRange_start);
            new_range.setEnd(lastEditRangeNode_new.firstChild,lastEditRange_end);
            selection.addRange(new_range);
            //console.log(new_range);
            //console.log(new_range.parentElement);
            //console.log(selection);
            }

        }
        show_auto_complete_menu(current_prex_wrod);
    }
}


//sleep函数
function sleep(delay){
    var start=(new Date()).getTime();
    while((new Date()).getTime()-start<delay)
    {
        continue;
    }
}


