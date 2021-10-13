//用一个字符串来保存当前的输入字符串并用这个字符串来进行前缀匹配
let current_prex_wrod="";

//监听键盘按下事件
txtEditor.onkeydown=(event)=>{
    switch(event.keyCode){  
        case 37 :  
            //console.log("key:37 left");
            break;
        case 39 :  
            //console.log("key:39 right");
            break;
        case 38 :  
            //console.log("key:38 up");
            break;
        case 40 :  
            //console.log("key:40 down");
            break;
        case 48 :  
            //console.log("key:48 0");
            current_prex_wrod+="0";
              
            break;
        case 49 :  
            //console.log("key:49 1");
            current_prex_wrod+="1";
              
            break;
        case 50 :  
            //console.log("key:50 2");
            current_prex_wrod+="2";
              
            break;
        case 51 :  
            //console.log("key:51 3");
            current_prex_wrod+="3";
              
            break;
        case 52 :  
            //console.log("key:52 4");
            current_prex_wrod+="4";
              
            break;
        case 53 :  
            //console.log("key:53 5");
            current_prex_wrod+="5";
              
            break;
        case 54 :  
            //console.log("key:54 6");
            current_prex_wrod+="6";
              
            break;
        case 55 :  
            //console.log("key:55 7");
            current_prex_wrod+="7";
              
            break;
        case 56 :  
            //console.log("key:56 8");
            current_prex_wrod+="8";
              
            break;
        case 57 :  
            //console.log("key:57 9");
            current_prex_wrod+="9";
              
            break;
        case 65 : 
            //console.log("key:65 a");
            current_prex_wrod+="a";
              
            break;
        case 66 :  
            //console.log("key:66 b");
            current_prex_wrod+="b";
              
            break;
        case 67 :  
            //console.log("key:67 c");
            current_prex_wrod+="c";
              
            break;
        case 68 : 
            //console.log("key:68 d");
            current_prex_wrod+="d";
              
            break;
        case 69 :  
            //console.log("key:69 e");
            current_prex_wrod+="e";
              
            break;
        case 70 :  
            //console.log("key:70 f");
            current_prex_wrod+="f";
              
            break;
        case 71 : 
            //console.log("key:71 g");
            current_prex_wrod+="g";
              
            break;
        case 72 :  
            //console.log("key:72 h");
            current_prex_wrod+="h";
              
            break;
        case 73 :  
            //console.log("key:73 i");
            current_prex_wrod+="i";
              
            break;
        case 74 : 
            //console.log("key:74 j");
            current_prex_wrod+="j";
              
            break;
        case 75 :  
            //console.log("key:75 k");
            current_prex_wrod+="k";
              
            break;
        case 76 :  
            //console.log("key:76 l");
            current_prex_wrod+="l";
              
            break;
        case 77 : 
            //console.log("key:77 m");
            current_prex_wrod+="m";
              
            break;
        case 78 :  
            //console.log("key:78 n");
            current_prex_wrod+="n";
              
            break;
        case 79 :  
            //console.log("key:79 o");
            current_prex_wrod+="o";
              
            break;
        case 80 : 
            //console.log("key:80 p");
            current_prex_wrod+="p";
              
            break;
        case 81 :  
            //console.log("key:81 q");
            current_prex_wrod+="q";
              
            break;
        case 82 :  
            //console.log("key:82 r");
            current_prex_wrod+="r";
              
            break;
        case 83 : 
            //console.log("key:83 s");
            current_prex_wrod+="s";
              
            break;
        case 84 :  
            //console.log("key:84 t");
            current_prex_wrod+="t";
              
            break;
        case 85 :  
            //console.log("key:85 u");
            current_prex_wrod+="u";
              
            break;
        case 86 : 
            //console.log("key:86 v");
            current_prex_wrod+="v";
              
            break;
        case 87 :  
            //console.log("key:87 w");
            current_prex_wrod+="w";
              
            break;
        case 88 :  
            //console.log("key:88 x");
            current_prex_wrod+="x";
              
            break;
        case 89 : 
            //console.log("key:89 y");
            current_prex_wrod+="y";
              
            break;
        case 90 :  
            //console.log("key:90 z");
            current_prex_wrod+="z";
              
            break;
        case 96 : 
            //console.log("key:97 0");
            current_prex_wrod+="0";
              
            break;
        case 97 :  
            //console.log("key:98 1");
            current_prex_wrod+="1";
              
            break;
        case 98 :  
           // console.log("key:99 2");
            current_prex_wrod+="2";
              
            break;
        case 99 : 
            //console.log("key:100 3");
            current_prex_wrod+="3";
              
            break;
        case 100 :  
           // console.log("key:101 4");
            current_prex_wrod+="4";
              
            break;
        case 101 :  
            //console.log("key:102 5");
            current_prex_wrod+="5";
              
            break;
        case 102 : 
            //console.log("key:102 6");
            current_prex_wrod+="6";
              
            break;
        case 103 :  
            console.log("key:103 7");
            current_prex_wrod+="7";
              
            break;
        case 104 :  
            console.log("key:104 8");
            current_prex_wrod+="8";
              
            break;
        case 105 : 
            console.log("key:105 9");
            current_prex_wrod+="9";
              
            break;
        case 32 :  
            console.log("key:32 space");
            current_prex_wrod="";
            break;
        case 13 :  
            console.log("key:13 enter");
            current_prex_wrod="";
            break;
        case 186 : 
            console.log("key:186 ;:");
            current_prex_wrod="";
            break;
        case 219 : 
            console.log("key:219 {[");
            current_prex_wrod="";
            break;
        case 220 : 
            console.log("key:220 \|");
            current_prex_wrod="";
            break;
        case 221 : 
            console.log("key:221 }]");
            current_prex_wrod="";
            break;
        case 191 : 
            console.log("key:191 ?/");
            current_prex_wrod="";
            break;
        case 222 : 
            console.log("key:222 '");
            current_prex_wrod="";
            break;
        case 187 : 
            console.log("key:187 =");
            current_prex_wrod="";
            break;
        case 8 : 
            console.log("key:8 backspace");
            current_prex_wrod=current_prex_wrod.substring(0, current_prex_wrod.length - 1);;
              
            break;
    }
}