function gen_tokens()
{
    current_audio_rad_count+=5;
    let cmdstr;
    cmdstr="tools\\lex.exe "+currentFile+" compiles\\tokens.txt";
    runExec(cmdstr);
    const response=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '词法分析完成！'
    });
}

function clear_gen_files()
{
    current_audio_rad_count+=5;
    let cmdstr;
    cmdstr="rmdir /s/q compiles";
    runExec(cmdstr);
    cmdstr="mkdir compiles";
    runExec(cmdstr);
    const response=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '清理解决方案完成！'
    });
}

function gen_middle_code()
{
    current_audio_rad_count+=5;
    let cmdstr;

    const response=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '生成中间代码完成！'
    });
}

function gen_asm()
{
    current_audio_rad_count+=5;
    let cmdstr="tools\\compiler.exe compiles\\";
    runExec(cmdstr);
    const response=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '生成汇编代码完成！'
    });
}

function gen_coe()
{
    current_audio_rad_count+=5;
    let cmdstr;
    const response=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '生成机器码完成！'
    });
}

function compile_current_code()
{
    current_audio_rad_count+=5;
    let cmdstr;
    const response1=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '编译！'
    });
    clear_gen_files();
    gen_tokens();
    //gen_middle_code();
    gen_asm();
    gen_coe();
    const response2=dialog.showMessageBoxSync(remote.getCurrentWindow(),{
        message: '编译完成！'
    });
    
}