# ���ñ���
$host.UI.RawUI.WindowTitle = "Uptime-kuma-Allinone"

# ��ȡ��ǰ�ű�����Ŀ¼
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# �����Ҫ�����������
Write-Host "`n�����Ҫ�����������..."
$env:PATH = "$scriptDir\git_v2.49.0\cmd;$env:PATH"
$env:PATH = "$scriptDir\git_v2.49.0\bin;$env:PATH"
$env:PATH = "$scriptDir\node_v18.20.8;$env:PATH"

# �����������
function Check-Network {
    Write-Host "�����������..."
    $pingResult = Test-Connection -ComputerName registry.npmmirror.com -Count 1 -Quiet
    if ($pingResult) {
        Write-Host "npm��������������"
        return $true
    } else {
        Write-Host "npm��������ʧ�ܣ������������Ӻ�����������"
        Pause
        return $false
    }
}

if (-not (Check-Network)) {
    Write-Host "`n������"
    return
}

# �����������2
function Check-Network2 {
    Write-Host "�����������..."
    $pingResult = Test-Connection -ComputerName github.com -Count 1 -Quiet
    if ($pingResult) {
        Write-Host "github����������"
        return $true
    } else {
        Write-Host "github����ʧ�ܣ������������Ӻ�����������"
        Pause
        return $false
    }
}

if (-not (Check-Network2)) {
    Write-Host "`n������"
    return
}

# ʹ�� Git ��¡Դ��
Write-Host "����ʹ�� Git ����Դ��..."
try {
    # ִ�� git clone ����
    git clone https://github.com/louislam/uptime-kuma.git "$scriptDir\uptime-kuma"
    
    # ����˳���
    if ($LASTEXITCODE -ne 0) {
        throw "Git ��¡ʧ�ܣ��˳���: $LASTEXITCODE"  # �ֶ��׳��쳣
    }

    Write-Host "GIT ��ȡ�ļ���ɣ���ʼִ�а�װ����..."
    Pause
} catch {
    # �����쳣�����������Ϣ
    Write-Host "Git ��¡ʧ�ܣ����� Git �Ƿ���ȷ��װ�������Ƿ�������������Ϣ: $_"
    Pause
    return
}

# git clone https://ghproxy.cn/https://github.com/louislam/uptime-kuma.git "$scriptDir\uptime-kuma"

# ������ĿĿ¼����װ����
Set-Location "$scriptDir\uptime-kuma"
npm config set registry https://registry.npmmirror.com/
Write-Host "���л� npm ����Դ..."
npm run setup
Write-Host "��װ��ɡ�"
Set-Location "$scriptDir"
Pause

# ���� Uptime Kuma
# ���� .bat �ļ������·��
$startbatFilePath = Join-Path -Path $scriptDir -ChildPath "����_Uptime_kuma.bat"
attrib.exe -h -s $startbatFilePath

# ѭ����ʾ�û����룬ֱ��������Чֵ
while ($true) {
    # ��ʾ�û�����
    $userInput = Read-Host "�������� Uptime Kuma��(Y/N)"

    # ����û�����
    if ($userInput -eq "Y" -or $userInput -eq "y") {
        Write-Output "�õģ�����������..."
        & $startbatFilePath
        break  # ����ѭ�����˳��ű�
    } elseif ($userInput -eq "N" -or $userInput -eq "n") {
        Write-Output "�˳��������ѽ�����"
        Write-Output "������ͨ��������_Uptime_kuma��������"
		Pause
        exit  # ֱ���˳��ű�
    } else {
        Write-Output "��Ч���룬������ Y �� N��"
        # ���˳�ѭ����������ʾ�û�����
    }
}