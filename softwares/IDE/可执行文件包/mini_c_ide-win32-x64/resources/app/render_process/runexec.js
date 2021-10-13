/*
    runexec.js
    lastmodified time:2021/01/08T16:00
    author:pan
 */

const execSync = require('child_process').execSync
let cmdPath = exePath
let workerProcess

function runExec (cmdStr) {
  // 执行命令行，若是命令不须要路径，或就是项目根目录，则不须要cwd参数：
  workerProcess = execSync(cmdStr)
  
  //console.log(workerProcess);
  
  return workerProcess.exitCode;
}