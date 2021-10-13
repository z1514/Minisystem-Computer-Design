/*
    file.js
    lastmodified time:2021/01/14T8:38
    author:pan
 */

 //当前打开的文件是不是c后缀的文件
var is_c_file_flag=false;

const fs = require('fs');
var txt_save="";
var tokens_list="";//tokens序列
//行号
var line=1;
    
//列号
var col=1;

// 打开文件并显示文本到界面
function open_file()
{
    if(currentFile==null){
        //显示文件选择窗口
        var files=dialog.showOpenDialogSync({
            properties: ['openFile']
        })
    

    //console.log(files[0]);
    //读取要打开的文件名
    currentFile=files[0];
    }

    //读取当前文件
    const txtRead=readText(currentFile);
    //修改当前窗口的标题为当前打开的文件名
    document.title =" " + currentFile;
    //保存当前文本内容
    txt_save=txtRead;


    var post_word=split_text(currentFile,".");
    
    if(post_word[1]=="c")
    {
        is_c_file_flag=true;
        //先清空一下字典树
        clear_trie();
        //初始化一个字典树并将预存的字符保存到其中
        add_defult_word_to_trie();
        console.log(word_start_with(""));
        //将当前文件内容加载到文本显示区域
        load_text_to_textarea();
    }
    else{
        txtEditor.innerText=txtRead;
        show_line_num()
    }
    // console.log(post_word);
     console.log("is_c_file_flag:"+is_c_file_flag);
    // console.log(txtRead);
    // console.log(txtEditor);
    // //txtEditor.value=txtRead;
    // console.log("open_file");

    

    
    // console.log(all_word_in_trie());
    // clear_trie();
    // console.log(all_word_in_trie());
}

// 将当前的文本内容加载到页面文本显示区域
function load_text_to_textarea(){

    //清空行列号
    line=1;
    col=1;

    //清空当前页面显示
    txtEditor.innerHTML="";
    lineEditor.innerHTML="";

    //清空当前tokens_list
    tokens_list="";

    // //调用词法分析器处理文本
    // var cmd_string="test_code "+currentFile;
    // runExec(cmd_string);
    // const tokens=readText("tokens.txt");
    // var tokens_by_line=split_text(tokens,"\n");

    // console.log(tokens_list);
    // txt_save=readText(currentFile);
    // console.log(txt_save)

    //调用词法分析程序
    //词法分析程序会自动处理txt_save里面的文本内容并将获得的token list保存到全局变量tokens_list里
    analysis_main();
    //console.log(tokens_list);


    //先按行分割tokenlist得到每行的token序列
    var tokens_by_line=split_text(tokens_list,"\n");
    
    //加载行号到左边的行号区域内
    var last_line=tokens_by_line[(tokens_by_line.length)-2];
    var last_line_split=split_text(last_line,"#");
    //得到最大行号
    var max_line_num=new Number(last_line_split[2]);
    //console.log(last_line_split);
    //console.log(max_line_num);

    //显示和渲染行号
    for(var k=1;k<=max_line_num;k++){
    render_font_color(lineEditor,k,"#444FAD",0,0);
    change_line_BR(lineEditor);
    }

    //下面开始显示代码文本信息

    //因为html没有方便的换行操作，我们使用括号匹配的计数器，用来处理缩进
    var count=0;
    // 遍历tokens序列进行输出
    for(var i=0;i<tokens_by_line.length;i++)
    {
        // 分割每行的tokens
        var tokens_single=split_text(tokens_by_line[i],"#");
        // 原来的值
        var token0=tokens_single[0];
        if(token0==" ")token0="\xa0";
        // 对应的属性
        var token1=tokens_single[1];
        if(token1=="id")
        {
            insert_into_trie(token0);
        }
        // 处理换行
        if(token0=="{")
        {
            count++;
        }
        if(token0=="}")
        {
            count--;
        }
        //console.log(tokens_single);

        // 如果检测到行号发生变化，进行换行
        if(tokens_single[2]!=line){
            var temp=(tokens_single[2])-line;
            if(token0=="\xa0")
            {
                //如果是行首的空格，跳过
                continue;
            }
            else{
            //console.log(temp);
            col=1;
            for(var j=0;j<temp;j++){
                line++;
                
                //文本编辑器换行
                change_line_BR(txtEditor);
                for(var k=0;k<count;k++)
                {
                //制表n次
                //用四个空格来表示制表符
                render_font_color(txtEditor,"\xa0\xa0\xa0\xa0","#00ee00",line,col);
                col++;
                }
            }
            }
        }
        // 显示和渲染每个font单元
        render_font_color(txtEditor,token0,text_color_dic[token1],line,col);
        if(token1=="fffffff"){
            //如果是错误的，那么给这个单词加上红色下划线
            render_wrong_text(line,col);
        }
        // 列号增加
        col++;
    }
    change_line_BR(txtEditor);
    change_line_BR(txtEditor);

    return;
}

//显示行号
function show_line_num()
{
    //显示和渲染行号
    for(var k=1;k<=50;k++){
        render_font_color(lineEditor,k,"#444FAD",0,0);
        change_line_BR(lineEditor);
    }
}

//保存当前文档
function saveCurrentDoc(){
    
    let save_file_as=null;
    // 如果是未保存过的或者是另存为的情况，打开选择保存路径
    if(!currentFile||saveFileAsFlag){
        const file = remote.dialog.showSaveDialogSync( {
            filters: [
                { name: "Text Files", extensions: ['txt', 'c', 'h', 'md'] }, 
                { name: 'All Files', extensions: ['*'] } ]
        });
        if(file) {
            currentFile=file;
            save_file_as=file;
        }

    }
    if(currentFile){
        save_text_editor_to_txt_save();
        save_txt_save_to_file(currentFile);
        //const txt_save=txtEditor.value;
        //saveText(txt_save, currentFile);
        document.title = " " + currentFile;
    }
    if(saveFileAsFlag){
        save_text_editor_to_txt_save();
        save_txt_save_to_file(save_file_as);
        //const txt_save=txtEditor.value;
        //saveText(txt_save, save_file_as);
        saveFileAsFlag=false;
    }
}

// 将当前txt_save内的内容保存到文件中
function save_txt_save_to_file(filePath){
    if(is_c_file_flag==true){
        saveText(txt_save, filePath);
    }
    else{
        var temp_text=txtEditor.innerText;
        saveText(temp_text, filePath);
    }
    return;
}

// 将当前文本框内的内容保存到txt_save中
function save_text_editor_to_txt_save(new_div_flag,last_font_before_div_id,div_text)
{
    // 先清空原来的txt_save
    txt_save="";
    // break两重循环的标记
    var breaked=false;
    // 遍历当前所有的font元素单元
    for(var i=1;i<=line;i++)
    {
        for(var j=1;j<=9999;j++)
        {
            var id=i*10000+j;
            //获取font元素
            let temp_font=document.getElementById(id);
            if(temp_font){
            //console.log(temp_font);
            //获取文本内容
            var temp_text=temp_font.firstChild.nodeValue;
            //console.log(temp_text);
            //如果是换行符的话，就跳过不保存
            if(temp_text!="\xa0\xa0\xa0\xa0"&&temp_text!=null){

                temp_text=remove_xa0_to_space(temp_text);
                
                txt_save+=temp_text;
                // 如果有特殊的div处理需要
                if(new_div_flag==true)
                    {
                        if(last_font_before_div_id==id)
                        {
                            //先换行
                            //div_text=remove_xa0_to_space(div_text);
                            txt_save+="\n";
                            //txt_save+=div_text;
                            //breaked=true;
                            //console.log(div_text);
                            //break;
                        }
                    }   
                }
            }
            
        }
        //每行结束就换行
        txt_save+="\n";
        if(breaked)break;
    }
    new_div_flag=false;
    return;
}

//弹出保存对话框询问用户是否保存当前文档
function askSaveIfNeed(){
    if(isSaved) return;
    const response=dialog.showMessageBoxSync(remote.getCurrentWindow(), {
        message: 'Do you want to save the current document?',
        type: 'question',
        buttons: [ 'Yes', 'No' ]
    });
    if(response==0) saveCurrentDoc(); //点击Yes按钮后保存当前文档
}

//读取文本文件
function readText(file){
    return fs.readFileSync(file, 'utf8');
}
//保存文本内容到文件
function saveText(text, file){
    fs.writeFileSync(file, text);
}

//分割字符串
function split_text(text,spliter){
    var NewArray = new Array();
  　return NewArray = text.split(spliter);
  
  }

//文本里的把\xa0替换成空格
function remove_xa0_to_space(text_before)
{
    var remove_xa0=split_text(text_before,"\xa0");
    // console.log(remove_xa0);
    var text_after=text_before;
    var last=remove_xa0.length;
    if(last>1){
        text_after=remove_xa0[0];
        for(var k=1;k<last;k++){
            text_after+=" ";
            text_after+=remove_xa0[k];
        }
    }
    return text_after;
}