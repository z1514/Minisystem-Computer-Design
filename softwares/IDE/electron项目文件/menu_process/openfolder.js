const {ipcRenderer,remote } = require('electron')
const {dialog,app} = require('electron').remote
let menuEditor = document.getElementById('menu_editor');
const fs = require('fs');
var readDir;//文件表
ipcRenderer.on('file_action', (event, arg) => {
    switch(arg){ 
    case 'open_folder': //打开文件夹
    console.log("open_folder");
    open_folder();
    isSaved=false;
    break;
    }
});

ipcRenderer.on('init_open_folder', (event, arg) => {

    console.log(arg);
    var new_folder=fs.readdirSync(arg);//获得该文件夹下的全部文件名称
    //console.log(new_folder);
    //var temp=addFile;
    //var split_file=split_text(arg,"\\");

    document.getElementById("folder"+arg).innerHTML="";
    var aText=document.createElement("img");
    aText.src="./down.png";
    document.getElementById("folder"+arg).appendChild(aText);
    load_file_to_div(new_folder,arg,document.getElementById(arg));
       // if_open=1;
       // console.log(if_open);

});

ipcRenderer.on('init_close_folder', (event, arg) => {

    console.log(arg);
    var new_folder=fs.readdirSync(arg);//获得该文件夹下的全部文件名称
    document.getElementById("folder"+arg).innerHTML="";
    var aText=document.createElement("img");
    aText.src="./right.png";
    document.getElementById("folder"+arg).appendChild(aText);
    //console.log(new_folder);
    //var temp=addFile;
    //var split_file=split_text(arg,"\\");

        //console.log(if_open);
        close_folder(arg);
        //if_open=0;
    
});

function get_file(addFile)
{
    var temp=addFile;
    var split_file=split_text(temp,"\\");
    temp="";
    for(var i=0;i<split_file.length-2;i++)
    {
        temp+=split_file[i]+"\\";
    }
    temp+=split_file[split_file.length-2];
    return temp;
}

function open_folder()
{
    readDir="";
    menuEditor.innerHTML="";
    //显示文件夹选择窗口
    var folder=dialog.showOpenDialogSync({
        properties: ['openDirectory']
    })

    readDir = fs.readdirSync(folder[0]);//获得该文件夹下的全部文件名称
   // console.log(readDir);
    load_file_to_div(readDir,folder[0],menuEditor)

    console.log(folder[0]+"\\"+readDir[1]);
    //add_folder(folder[0]+"\\"+readDir[1]);

    //ipcRenderer.sendSync('initAllFile', allfile);
}


function add_folder(address)
{
    console.log(address);
    var new_folder=fs.readdirSync(address);//获得该文件夹下的全部文件名称
    //console.log(new_folder);
    //var temp=addFile;
    //var split_file=split_text(address,"\\");

    load_file_to_div(new_folder,address,document.getElementById(address));
}



function load_file_to_div(allname,address,area)
{//所有文件名称，所在文件夹路径，区域
    console.log(allname);
    var allfile=[];
    var count=0;
    var flag=0;
    var file_address;
    var state;
    for(var i=0;i<allname.length;i++)
    {
        file_address=address+"\\"+allname[i];
        state = fs.lstatSync(file_address);

        if (state.isDirectory()) {
            flag=1;
           //console.log(file_address+'是文件夹');
        } else {
            flag=0;
            allfile[count]=file_address;
            count++;
           //console.log(file_address+'是文件');
        }
        
        load_readDir(allname[i],file_address,flag,area);
    }

    ipcRenderer.send('initAllFile', allfile);
}

//显示文件列表
function load_readDir(text,address,flag,area)
{//文件名称，文件地址，文件类型，区域类型

    if(area!=menuEditor)
    {
        var bFont=document.createElement("FONT");
        var bText=document.createTextNode("\xa0\xa0");
        //bText.src="./right.png";
 
        bFont.setAttribute("id","add"+address);
        area.appendChild(bFont);
        bFont.appendChild(bText);
    }

    if(flag==1)
    {
        var aFont=document.createElement("FONT");
        var aText=document.createElement("img");
        aText.src="./right.png";
 
        aFont.setAttribute("id","folder"+address);
        area.appendChild(aFont);
        aFont.appendChild(aText);
    }
    else if(flag==0)
    {
        var aFont=document.createElement("FONT");
        var aText=document.createElement("img");
        aText.src="./file2.png";
 
        aFont.setAttribute("id","file"+address);
        area.appendChild(aFont);
        aFont.appendChild(aText);
    }
    var oFont=document.createElement("FONT");
    var oText=document.createTextNode(text);
    oFont.setAttribute("id",address); 
    area.appendChild(oFont);
    oFont.appendChild(oText);
    var br=document.createElement("BR");
    oFont.appendChild(br);

    var data=[];
    data[0]=address;
    data[1]=flag;
    data[2]=0;
   // console.log(data);

    oFont.onclick=function(e){
        e.stopPropagation();//阻止事件冒泡即可
        //console.log("**********************************"+data[1]+data[0]);
        ipcRenderer.send('openFile', data);
        if(data[2]==0) data[2]=1;
        else if(data[2]==1) data[2]=0;
        //console.log("**********************************"+data[2]);
    }
}

//关闭文件夹列表
function close_folder(address)
{
    var new_folder=fs.readdirSync(address);//获得该文件夹下的全部文件名称
    var file_id=[];
    for(var i=0;i<new_folder.length;i++)
    {
        file_id[i]=address+"\\"+new_folder[i];
        //console.log(file_id[i]);
        state = fs.lstatSync(file_id[i]);
        if (state.isDirectory())
        {
            document.getElementById("folder"+file_id[i]).remove();
        }
        else{
            document.getElementById("file"+file_id[i]).remove();
        }
        document.getElementById("add"+file_id[i]).remove();
        document.getElementById(file_id[i]).remove();
    }
}

function split_text(text,spliter){
    var NewArray = new Array();
  　return NewArray = text.split(spliter);
  
  }
