/*
    main.js
    lastmodified time:2021/01/14T8:52
    author:pan
 */
//主进程

const path = require('path')
const {BrowserWindow, Menu, app, shell,ipcMain,dialog} = require('electron')

// 当前的可执行文件所在目录
let appPath = app.getPath('exe')
// 获取上一层的目录 app 是当前目录名称 须要给去掉
let exePath = appPath.replace(/\\app\\studio.exe/, '')

const folderWindowOptions = {
  x:200,
  y:60,
  width: 1200,
  height: 950,
  fullscreenable:true,
  //autoHideMenuBar:true,
  //frame: false,
  webPreferences:{enableRemoteModule: true,nodeIntegration:true}
}

const mainWindowOptions = {
  x:575,
  y:160,
  width: 800,
  height: 800,
  resizable:false,
  show:false,
  frame: false,
  transparent: true,
  webPreferences:{enableRemoteModule: true,nodeIntegration:true}
}

//保存对应的文件路径和代码界面窗口编号
let current_opened_file_array=new Array();
//文件夹界面窗口
let folderWindow;
// 主界面窗口
let mainWindow=new Array();
//当前聚焦的窗口
let current_code_window;
// //打开过的文件夹列表
// let exist_file_floder=new Array();

//当Electron完成初始化后触发，这里初始化后就会去创建浏览器窗口并加载主页面
app.on('ready', () => {
    createWindow()
  })

//当所有浏览器窗口被关闭后触发，一般此时就退出应用了
app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
      app.quit()
    }
  })

//当app激活时触发，一般针对macOS要需要处理。
app.on('activate', () => {
    if (mainWindow === null) {
      createWindow()
    }
  })
  
var last_folder_window_bound_before_fullscreen;

// 创建窗口
function createWindow () {
    
  current_code_window=0;

  folderWindow = new BrowserWindow(folderWindowOptions)
  folderWindow.loadURL(path.join('file://', __dirname, '/menu_process/menu.html'))
  //folderWindow.webContents.openDevTools();

  folderWindow.on('closed', () => {
    folderWindow = null;
    app.quit();
  })

  folderWindow.on('will-move',(event,newBounds) => {
    for(let i=0;i<mainWindow.length;i++)
    {
      let new_x=(newBounds.x)+370;
      let new_y=(newBounds.y)+100;
      let mainWindowNewBound={x:new_x,y:new_y}
      mainWindow[i].setBounds(mainWindowNewBound);
      main_window_focus(current_code_window);
    }
  })

  folderWindow.on('enter-full-screen',() => {
    last_folder_window_bound_before_fullscreen=folderWindow.getBounds();
    for(let i=0;i<mainWindow.length;i++)
    {
      let new_x=370;
      let new_y=80;
      let mainWindowNewBound={x:new_x,y:new_y}
      mainWindow[i].setBounds(mainWindowNewBound);
      main_window_focus(current_code_window);
    }
  })

  folderWindow.on('leave-full-screen',() => {
    let newBounds=last_folder_window_bound_before_fullscreen;
    for(let i=0;i<mainWindow.length;i++)
    {
      let new_x=(newBounds.x)+370;
      let new_y=(newBounds.y)+100;
      let mainWindowNewBound={x:new_x,y:new_y}
      mainWindow[i].setBounds(mainWindowNewBound);
      main_window_focus(current_code_window);
    }
  })

  folderWindow.on('minimize',() => {
    last_folder_window_bound_before_fullscreen=folderWindow.getBounds();
    for(let i=0;i<mainWindow.length;i++)
    {
      mainWindow[i].minimize();
    }
  })

  folderWindow.on('restore',() => {
    let newBounds=last_folder_window_bound_before_fullscreen;
    for(let i=0;i<mainWindow.length;i++)
    {
      mainWindow[i].restore();
      let new_x=(newBounds.x)+370;
      let new_y=(newBounds.y)+100;
      let mainWindowNewBound={x:new_x,y:new_y}
      mainWindow[i].setBounds(mainWindowNewBound);
      main_window_focus(current_code_window);
    }
  })


  folderWindow.on('moved',()=>{
    main_window_focus(current_code_window);
  })

    const menu = Menu.buildFromTemplate(template);
    Menu.setApplicationMenu(menu);
}


//主进程监听与渲染进程的通信

//监听与渲染进程的通信
//收到渲染进程的退出程序确认之后，退出程序
ipcMain.on('exit', (event, arg) => {
  switch(arg){
    case 'exit':
      app.quit();//退出程序
      break;
  }
});

//记录当前打开的所有文件数
let count=0;
//初始化一个文件列表（初始化一组窗口）
ipcMain.on('initAllFile', (event, arg) => {
  init_window_with_file_list(arg);
})

//显示某个已经初始化过的窗口
ipcMain.on('openFile', (event, arg) => {

  switch(arg[1]){
    case 0:
      let find=-1;
      for(let i=0;i<current_opened_file_array.length;i++){
      if(current_opened_file_array[i]==arg[0]){
        find=i;
        }
      }
      if(find!=-1)
      {
        mainWindow[find].webContents.send('init_open_file',arg[0]);
        folderWindow.webContents.send('load_open_file',arg[0]);
        mainWindow[find].show();
        current_code_window=find;
      }
      break;
    case 1:
      switch(arg[2]){
        case 0:
          main_window_focus(current_code_window);
          folderWindow.webContents.send('init_open_folder', arg[0]);
          break;
        case 1:
          main_window_focus(current_code_window);
          folderWindow.webContents.send('init_close_folder', arg[0]);
          break;
        }
      break;
  }
});

//聚焦特定代码窗口（参数：窗口打开的文件路径）
ipcMain.on('focus_codeWindow',(event,arg) => {
  let find=-1;
  for(let i=0;i<current_opened_file_array.length;i++){
    if(current_opened_file_array[i]==arg){
      find=i;
    }
  }
if(find!=-1)
{
  main_window_focus(find);
}
});

//聚焦当前聚焦的代码编辑窗口
ipcMain.on('focus_cur_codeWindow',(event,arg) => {
  main_window_focus(current_code_window);
});

//关闭某个代码编辑窗口
ipcMain.on('hide_codeWindow',(event,arg) => {
  hide_code_mainWindow(arg);
});

//删除某个代码编辑窗口
ipcMain.on('delete_codeWindow',(event,arg) => {
  remove_code_mainWindow(arg);
});

//-----------------------------------

//聚焦某个代码编辑窗口
function main_window_focus(k){
  mainWindow[k].focus();
  current_code_window=k;
}

//按照文件列表新建窗口
function init_window_with_file_list(file_list)
{
  let temp_count=count;
  let all=temp_count+(file_list.length);
  for(let k=temp_count;k<all;k++){
    var flag=init_code_eidt_window(count,file_list[(k-temp_count)]);
    if(flag==true)count++;
  }
}

//新建代码编辑窗口
function init_code_eidt_window(num,file_path)
{
  let find=-1;
  for(let i=0;i<current_opened_file_array.length;i++){
    if(current_opened_file_array[i]==file_path){
      find=i;
    }
  }
  if(find==-1){
    mainWindow[num] = new BrowserWindow(mainWindowOptions)
    mainWindow[num].loadURL(path.join('file://', __dirname, '/render_process/index.html'));
    mainWindow[num].setSkipTaskbar(true);
    //mainWindow[num].webContents.openDevTools();
    //mainWindow[num].setAlwaysOnTop(true);
    mainWindow[num].on('closed', () => {
      mainWindow[num] = null
    });
    current_opened_file_array[count]=file_path;
    return true;
  }
}

//清理某个代码编辑窗口
function remove_code_mainWindow(file_path)
{
  let find=-1;
  for(let i=0;i<current_opened_file_array.length;i++){
    if(current_opened_file_array[i]==file_path){
      find=i;
    }
  }
  if(find!=-1)
  {
    for(let j=find;j<current_opened_file_array.length;j++)
    {
      mainWindow[f]=mainWindow[f+1];
    }
    mainWindow[(current_opened_file_array.length)-1].close();
    mainWindow.splice([(mainWindow.length)-1],1);
    current_opened_file_array.splice(((current_opened_file_array.length)-1),1);
  }
}


//隐藏某个代码编辑窗口
function hide_code_mainWindow(file_path)
{
  let find=-1;
  for(let i=0;i<current_opened_file_array.length;i++){
    if(current_opened_file_array[i]==file_path){
      find=i;
    }
  }
  if(find!=-1)
  {
    if(find==current_code_window)
    {
      for(let k=0;k<current_opened_file_array.length;k++)
      {
        if(k!=find)
        {
          current_code_window=k;
          break;
        }
      }
    }
    main_window_focus(current_code_window);
    mainWindow[find].hide();
  }
}


//顶部菜单栏  
  let template = [{
  label: '文件',
  role: 'file_management',
  submenu: [{
    label: '新建窗口',
    role: 'new_window',
    click(){
      createWindow();
    },
  },{
    label: '新建文件',
    role: 'new_file',
    click(){
      mainWindow[current_code_window].webContents.send('file_action', 'new_file'); //点击后向主页渲染进程发送“新建文件”的命令
    },
  },{
    type: 'separator'
  }
  // ,{
  //   label: '打开文件',
  //   role: 'open_file',
  //   click: () => {
  //     //mainWindow.webContents.send('init_open_file', test);
  //     //mainWindow.webContents.send('file_action', 'open_file'); //点击后向主页渲染进程发送“打开文件”的命令
  // }
  // }
  ,{
    label: '打开文件夹',
    role: 'open_folder',
    click: () => {
      folderWindow.webContents.send('file_action', 'open_folder'); //点击后向主页渲染进程发送“打开文件夹”的命令
  }
  },
  {
    type: 'separator'
  },{
    label: '保存文件',
    role: 'save_file',
    click: () => {
      mainWindow[current_code_window].webContents.send('file_action', 'save_file'); //点击后向主页渲染进程发送“保存文件”的命令
  }
  },{
    label: '另存为',
    role: 'save_file_as',
    click: () => {
      mainWindow[current_code_window].webContents.send('file_action', 'save_file_as'); //点击后向主页渲染进程发送“打另存文件”的命令
  }
  },{
    type: 'separator'
  },{
    label: '退出',
    role: 'exit_app',
    click: () => {
      mainWindow[current_code_window].webContents.send('file_action', 'exit'); //点击后向主页渲染进程发送“退出”的命令
      //app.quit();
    }
  }]
  
}, {
  label: '编辑',
  role: 'content_management',
  submenu: [{
    label: '撤销',
    accelerator: 'CmdOrCtrl+Z',
    role: 'undo'
  }, {
    label: '重做',
    accelerator: 'Shift+CmdOrCtrl+Z',
    role: 'redo'
  }, {
    type: 'separator'
  }, {
    type: 'separator'
  }, {
    label: '剪切',
    accelerator: 'CmdOrCtrl+X',
    role: 'cut'
  }, {
    label: '复制',
    accelerator: 'CmdOrCtrl+C',
    role: 'copy'
  }, {
    label: '粘贴',
    accelerator: 'CmdOrCtrl+V',
    role: 'paste'
  }, {
    label: '全选',
    accelerator: 'CmdOrCtrl+A',
    role: 'selectall'
  }]
}, {
  label: '运行',
  role: 'run_and_debug',
  submenu: [{
    label: '一键编译',
    role: 'compile_current_code',
    click: () => {
      mainWindow[current_code_window].webContents.send('compile_action','compile_current_code');
    },
  },{
    label: '词法分析',
    role: 'gen_tokens',
    click: () => {
      mainWindow[current_code_window].webContents.send('compile_action','gen_tokens');
    },
  },{
    label: '生成汇编代码',
    role: 'gen_asm',
    click: () => {
      mainWindow[current_code_window].webContents.send('compile_action','gen_asm');
    },
  },{
    label: '生成机器码',
    role: 'gen_coe',
    click: () => {
      mainWindow[current_code_window].webContents.send('compile_action','gen_coe');
    },
  },{
    label: '清理解决方案',                                                                          
    role: 'clear_gen_files',
    click: () => {
      mainWindow[current_code_window].webContents.send('compile_action','clear_gen_files');
    },
  }]
}, {
  label: '设置',
  role: 'settings',
  submenu: [{
    label: '切换全屏',
    accelerator: (() => {
      if (process.platform === 'darwin') {
        return 'Ctrl+Command+F'
      } else {
        return 'F11'
      }
    })(),
    click: (item, focusedWindow) => {
      if (focusedWindow) {
        folderWindow.setFullScreen(!folderWindow.isFullScreen())
      }
    }
  }]
}, {
  label: '帮助',
  role: 'help',
  submenu: [{
    label: '开发人员信息'
  },{
    type: 'separator'
  },{
    label: '学习更多',
    click: () => {
      shell.openExternal('http://electron.atom.io')
    }
  }]
}
]
