# 设置标题
$host.UI.RawUI.WindowTitle = "Uptime-kuma-Allinone"

# 获取当前脚本所在目录
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 添加重要组件环境变量
Write-Host "`n添加重要组件环境变量..."
$env:PATH = "$scriptDir\git_v2.49.0\cmd;$env:PATH"
$env:PATH = "$scriptDir\git_v2.49.0\bin;$env:PATH"
$env:PATH = "$scriptDir\node_v18.20.8;$env:PATH"

# 检查网络连接
function Check-Network {
    Write-Host "检查网络连接..."
    $pingResult = Test-Connection -ComputerName registry.npmmirror.com -Count 1 -Quiet
    if ($pingResult) {
        Write-Host "npm镜像连接正常。"
        return $true
    } else {
        Write-Host "npm镜像连接失败，请检查网络连接后重新启动。"
        Pause
        return $false
    }
}

if (-not (Check-Network)) {
    Write-Host "`n结束。"
    return
}

# 检查网络连接2
function Check-Network2 {
    Write-Host "检查网络连接..."
    $pingResult = Test-Connection -ComputerName github.com -Count 1 -Quiet
    if ($pingResult) {
        Write-Host "github连接正常。"
        return $true
    } else {
        Write-Host "github连接失败，请检查网络连接后重新启动。"
        Pause
        return $false
    }
}

if (-not (Check-Network2)) {
    Write-Host "`n结束。"
    return
}

# 使用 Git 克隆源码
Write-Host "正在使用 Git 载入源码..."
try {
    # 执行 git clone 命令
    git clone https://github.com/louislam/uptime-kuma.git "$scriptDir\uptime-kuma"
    
    # 检查退出码
    if ($LASTEXITCODE -ne 0) {
        throw "Git 克隆失败，退出码: $LASTEXITCODE"  # 手动抛出异常
    }

    Write-Host "GIT 拉取文件完成，开始执行安装程序..."
    Pause
} catch {
    # 捕获异常并输出错误信息
    Write-Host "Git 克隆失败，请检查 Git 是否正确安装或网络是否正常。错误信息: $_"
    Pause
    return
}

# git clone https://ghproxy.cn/https://github.com/louislam/uptime-kuma.git "$scriptDir\uptime-kuma"

# 进入项目目录并安装依赖
Set-Location "$scriptDir\uptime-kuma"
npm config set registry https://registry.npmmirror.com/
Write-Host "已切换 npm 镜像源..."
npm run setup
Write-Host "安装完成。"
Set-Location "$scriptDir"
Pause

# 启动 Uptime Kuma
# 构造 .bat 文件的相对路径
$startbatFilePath = Join-Path -Path $scriptDir -ChildPath "启动_Uptime_kuma.bat"
attrib.exe -h -s $startbatFilePath

# 循环提示用户输入，直到输入有效值
while ($true) {
    # 提示用户输入
    $userInput = Read-Host "现在启动 Uptime Kuma？(Y/N)"

    # 检查用户输入
    if ($userInput -eq "Y" -or $userInput -eq "y") {
        Write-Output "好的，正在启动中..."
        & $startbatFilePath
        break  # 结束循环并退出脚本
    } elseif ($userInput -eq "N" -or $userInput -eq "n") {
        Write-Output "退出，进程已结束。"
        Write-Output "后续可通过“启动_Uptime_kuma”来启动"
		Pause
        exit  # 直接退出脚本
    } else {
        Write-Output "无效输入，请输入 Y 或 N。"
        # 不退出循环，继续提示用户输入
    }
}