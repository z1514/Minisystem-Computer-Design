/*
    highlight.js
    lastmodified time:2021/01/12T21:40
    author:pan
 */

var text_color_dic={
    "void":"#444FAD",
    "int":"#444FAD",
    "char":"#444FAD",
    "double":"#444FAD",
    "float":"#444FAD",
    "bool":"#444FAD",
    "true":"#006fff",
    "false":"#006fff",
    "long":"#006fff",
    "short":"#006fff",
    "static":"#006fff",
    "const":"#006fff",
    "sizeof":"#006fff",
    "enum":"#006fff",
    "typedf":"#006fff",
    "struct":"#006fff",
    "switch":"#006fff",
    "break":"#006fff",
    "case":"#006fff",
    "default":"#006fff",
    "do":"#006fff",
    "while":"#006fff",
    "for":"#006fff",
    "auto":"#006fff",
    "continue":"#006fff",
    "if":"#006fff",
    "else":"#006fff",
    "return":"#60BA46",
    "id":"#4d4b4b",
    "+":"#946635",
    "-":"#946635",
    "*":"#946635",
    "/":"#946635",
    "=":"#946635",
    "single":"#808000",
    "multi":"#808000",
    "hex":"#a400c7"
};

// function give_array_color(textArray){
//     for(var i=0;i<textArray.length;i++)
//     {
//         var oFont=document.createElement("FONT");
//         var oText=document.createTextNode(textArray[i]); 
//         txtEditor.appendChild(oFont);
//         oFont.appendChild(oText);

//         var oFont1=document.createElement("FONT");
//         var oText1=document.createTextNode(" "); 

//         txtEditor.appendChild(oFont1);
//         oFont1.appendChild(oText1);
//         //console.log("give_color");
//     }
    
//   }
//   function give_color(text){
        
//         var oFont=document.createElement("FONT");
//         var id=10000+50;
//         oFont.setAttribute("id",id);
//         oFont.setAttribute("contenteditable",false);
//         var oText=document.createTextNode(text); 
//         oFont.style.color=text_color_dic[text];
//         txtEditor.appendChild(oFont);
//         oFont.appendChild(oText);

//         // var oFont1=document.createElement("FONT");
//         // var oText1=document.createTextNode(" "); 

//         // txtEditor.appendChild(oFont1);
//         // oFont1.appendChild(oText1);
//         //console.log("give_color");
//   }

  //新建渲染的font元素
  function render_font_color(element,text,color,row,col){
    var oFont=document.createElement("FONT");
    var id=row*10000+col;
    oFont.setAttribute("id",id);
    //console.log("render font: id:"+id+" text:"+text)
    var oText=document.createTextNode(text); 
    oFont.style.color=color;
    element.appendChild(oFont);
    oFont.appendChild(oText);
}

//换行的函数
function change_line_BR(element)
{
    var oFont1=document.createElement("BR");
    var oText1=document.createTextNode("\r"); 
    element.appendChild(oFont1);
    oFont1.appendChild(oText1);
}


function render_wrong_text(row,col){
    var id=row*10000+col;
    let temp_font=document.getElementById(id);
    temp_font.className="wrong_text";
}