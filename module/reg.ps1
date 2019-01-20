### ���W�X�g���ǉ�/�X�V
function RegSet( $RegPath, $RegKey, $RegKeyType, $RegKeyValue ){
    # ���W�X�g�����̂��̗̂L���m�F
    $Elements = $RegPath -split "\\"
    $RegPath = ""
    $FirstLoop = $True
    foreach ($Element in $Elements ){
        if($FirstLoop){
            $FirstLoop = $False
        }
        else{
            $RegPath += "\"
        }
        $RegPath += $Element
        if( -not (test-path $RegPath) ){
            echo "Add Registry : $RegPath"
            md $RegPath
        }
    }

    # Key�L���m�F
    $Result = Get-ItemProperty $RegPath -name $RegKey -ErrorAction SilentlyContinue
    # �L�[����������
    if( $Result -ne $null ){
        Set-ItemProperty $RegPath -name $RegKey -Value $RegKeyValue
#        echo "Set-ItemProperty $RegPath -name $RegKey -Value $RegKeyValue"
    }
    # �L�[������������
    else{
        # �L�[��ǉ�����
        New-ItemProperty $RegPath -name $RegKey -PropertyType $RegKeyType -Value $RegKeyValue
#        echo "New-ItemProperty $RegPath -name $RegKey -PropertyType $RegKeyType -Value $RegKeyValue"
    }
    Get-ItemProperty $RegPath -name $RegKey
}

$RegPath12 = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"
$RegKey1 = "Enabled"
$RegKey2 = "DisabledByDefault"
$RegKeyType = "DWord"
$RegKeyValue1 = 1
$RegKeyValue2 = 0

RegSet $RegPath12 $RegKey1 $RegKeyType $RegKeyValue1
RegSet $RegPath12 $RegKey2 $RegKeyType $RegKeyValue2

$RegPath3 = "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319"
$RegKey3 = "SchUseStrongCrypto"
$RegKeyType = "DWord"
$RegKeyValue3 = 1

RegSet $RegPath3 $RegKey3 $RegKeyType $RegKeyValue3

$RegPath4 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319"
$RegKey4 = "SchUseStrongCrypto"
$RegKeyType = "DWord"
$RegKeyValue4 = 1

RegSet $RegPath4 $RegKey4 $RegKeyType $RegKeyValue4