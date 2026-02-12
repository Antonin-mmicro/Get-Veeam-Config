$name = $env:COMPUTERNAME
$fichier = "C:\ProgramData\Veeam\Endpoint\Job_$name\Job.Job_$name.Backup.log"
$debut = "================= Job Settings begin ================="
$fin = "================= Job Settings end ================="

$contenu = Get-Content -Path $fichier
$donnees = @()
$trouve = $false

$veeamKey = "HKLM:\SOFTWARE\Veeam\Veeam Agent for Microsoft Windows"

if (Test-Path $veeamKey) {
    $version = (Get-ItemProperty -Path $veeamKey -Name Version).Version
    $version = '                      <01> Info     Version de Veeam : ' + $version
} else {
    Write-Host "Veeam Agent for Microsoft Windows n'est pas installé."
    Read-Host "Appuyez sur Entrée pour continuer..."
    exit 0
}

foreach ($ligne in $contenu) {
    if ($ligne -like "*$debut*") {
        $trouve = $true
    } elseif ($ligne -like "*$fin*") {
        $donnees = $donnees + $version
        $trouve = $false
        $donnees | Out-String
        break
    } elseif ($trouve) {
        $donnees += $ligne
    }
}