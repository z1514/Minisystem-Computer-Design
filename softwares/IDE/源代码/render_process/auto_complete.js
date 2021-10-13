/*
    auto_complete.js
    lastmodified time:2021/01/13T18:41
    author:pan
 */

var last_recent_range_at_font_id_for_auto_complete;
var new_range = new Range();


//显示可选下拉框
function show_auto_complete_menu(word_prex){
    
    if(word_prex=="")return;
    console.log(word_prex);
    var temp_array=new Array();
    temp_array=word_start_with(word_prex)
    console.log(temp_array);
    console.log(word_start_with(""));

    //获取当前光标所在的font id 
    var selection = window.getSelection();
    var Range = selection.getRangeAt(0);
    
    var range_at_font=Range.endContainer.parentElement;
    //获取那个元素的id
    var RangeNode_id=range_at_font.id;
    last_recent_range_at_font_id_for_auto_complete=RangeNode_id;
    let temp_font=document.getElementById(RangeNode_id);
    var Menu=document.createElement("DIV");
    temp_font.className="dropdown";
    Menu.className="dropdown-content";
    Menu.setAttribute("contenteditable",false);
    temp_font.appendChild(Menu);

    //将可选文本显示到一个可选下拉框中

    for(let i=0;i<temp_array.length;i++)
    {
        var temp_p=document.createElement("P");
        var temp_text=document.createTextNode(temp_array[i]);
        temp_p.appendChild(temp_text);
        temp_p.onclick=function(){
            current_audio_rad_count+=10;

            current_prex_wrod=temp_array[i];
            let temp_font=document.getElementById(RangeNode_id);
            temp_font.innerHTML="";
            var temp_text_node=document.createTextNode(current_prex_wrod); 
            temp_font.appendChild(temp_text_node);
            oninput_flag=true;

            var selection = window.getSelection();
            console.log(selection);
            selection.removeAllRanges();
            console.log(selection);
            //将光标放到输出完的单词的最后
            new_range.setStart(temp_font.firstChild,temp_font.firstChild.length);
            new_range.setEnd(temp_font.firstChild,temp_font.firstChild.length);
            console.log(new_range);
        
            selection.addRange(new_range);
            console.log(selection);
            current_prex_wrod="";


        }
        Menu.appendChild(temp_p);
        
    }
}

//监听可选下拉框的点击函数


// 自动补全的思路
// 在内存中维护一个字典树保存当前所有的关键字和已经输入的id
// 检测到键盘输入一个字符 [x] 就使用 startwith函数得到所有以[x]开头的单词并返回一个数组
// 然后用一个可选择的下拉框来显示它

var defult_word=
["int","double","char","short","main","long","float","bool",
"true","false","static","const","enum","length","this","that",
"struct","switch","if","else","for","while","break","case",
"return","auto","continue"];

//字典树的实现
//需要实现的功能有：建立字典树，往字典树里插入新元素，删除元素，找到所有指定前缀的节点，查找指定单词
class TreeNode{
    constructor(val){
        this.val=val;
        this.isWord=false;
        this.children={}
    }
}


var Trie=function(){
    this.root=new TreeNode();
}

var trie = new Trie();

//插入
Trie.prototype.insert=function(word){
    let cur_node=this.root;
    let word_array=word.split("");
    for(let i=0;i<word_array.length;i++)
    {
        let is_have_child_node=cur_node.children[word_array[i]];
        if(!is_have_child_node){
            cur_node.children[word_array[i]]=new TreeNode(word_array[i]);
        }
        cur_node=cur_node.children[word_array[i]];
    
    if(i===word_array.length-1){
        cur_node.isWord=true;
    }
    }
}

//查找
Trie.prototype.search=function(word){
    let cur_node=this.root;
    let word_array=word.split("");
    for(let i=0;i<word_array.length;i++)
    {
        if(!cur_node.children[word_array[i]])
        {
            return false;
        }
        cur_node=cur_node.children[word_array[i]];
        if(i===word_array.length-1){
            return cur_node.isWord===true;
        }
    }
}

//清空字典树
Trie.prototype.clear=function(){
    let cur_node=this.root;
    cur_node.children={};
}

var count=0;
//返回所有前缀匹配的word
Trie.prototype.starts_with=function(pre_word){
    var word_start_with=new Array();
    let cur_node=this.root;
    let word_array=pre_word.split("");
    let head="";
    for(let i=0;i<word_array.length;i++)
    {
        if(!cur_node.children[word_array[i]])
        {
            return false;
        }
        cur_node=cur_node.children[word_array[i]];
        head+=cur_node.val;
    }
    let cur_val=cur_node.val;
    var temp_data="";
    //console.log(head);
    print_all(word_start_with,head,cur_node,temp_data);
    //word_start_with.length=0;
    //count=0;
    return word_start_with;
};

function print_all(word_start_with,head,node,data){
    if(node.isWord==true)
    {
        word_start_with[count]=head+data;
        count++;
    }
    for(let i in node.children)
    {
        data+=node.children[i].val;
        print_all(word_start_with,head,node.children[i],data);
        data = data.substring(0, data.length - 1);
    }
    return;
};

function word_start_with(text){
    let temp=trie.starts_with(text);
    count =0;
    return temp;
}

function insert_into_trie(text)
{
    if(trie.search(text)==true)
    {
        return true;
    }
    else{
        return trie.insert(text);
    }
}

function search_from_trie(text)
{
    return trie.search(text);
}

function all_word_in_trie(){
    let temp=trie.starts_with("");
    count =0;
    return temp;
}

function clear_trie(){
    trie.clear();
}

function add_defult_word_to_trie(){
    for(let n=0;n<defult_word.length;n++)
    {
        insert_into_trie(defult_word[n]);
    }
};


//js栈的实现
function Stack () {
    this.dataStore = [];    //初始化为空
    this.top = 0;           //记录栈顶位置
    this.pop = pop;         //出栈
    this.push = push;       //入栈
    this.peek = peek;       //查看栈顶元素
    this.length = length;   //查看栈内元素总数
    this.clear = clear;     //清空栈
}

function push( element ){
    this.dataStore[this.top++] = element;
}

function pop(){
    return this.dataStore[--this.top];
}

//该方法返回的是栈顶元素，即 top - 1 个位置元素

function peek(){
    if( this.top > 0 ) return this.dataStore[this.top-1];
    else return 'Empty';
}

//该方法通过返回 top 属性的值来返回栈内总的元素个数

function length(){
    return this.top;
}

function clear(){
    delete this.dataStore;
    this.dataStore = [];
    this.top = 0;
}

