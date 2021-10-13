let tabEditor = document.getElementById('tab_editor');

ipcRenderer.on('load_open_file', (event, arg) => {
var if_open=document.getElementById("tab_"+arg);
console.log(if_open);
if(if_open)
{
    console.log("cunzai")
    ipcRenderer.send('focus_cur_codeWindow', arg);
    //load_tab(arg);
}
else
{
    console.log("bucunzai")
    load_tab(arg);
}
});

function load_tab(address)
{
    var split_file=split_text(address,"\\");
    var oFont=document.createElement("FONT");
    var oText=document.createTextNode(split_file[split_file.length-1]);
    oFont.setAttribute("id","tab_"+address); 
    tabEditor.appendChild(oFont);
    oFont.appendChild(oText);

    oFont.onclick=function(){
        ipcRenderer.send('focus_codeWindow', address);
        //console.log(address);
    }
    var aFont=document.createElement("FONT");
    var aText=document.createElement("img");
    aText.src="./close.png";
    console.log()
    aFont.setAttribute("id","tab_close_"+address);
    aFont.onclick=function(){
        ipcRenderer.send('hide_codeWindow', address);
        document.getElementById("tab_"+address).remove();
        document.getElementById("tab_close_"+address).remove();
        document.getElementById("kong"+address).remove();
    }
    tabEditor.appendChild(aFont);
    aFont.appendChild(aText);
   
    var bFont=document.createElement("FONT");
    var bText=document.createTextNode("\xa0\xa0");
    bFont.setAttribute("id","kong"+address); 
    tabEditor.appendChild(bFont);
    bFont.appendChild(bText);
}