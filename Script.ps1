Write-Host "Ejecutando el script..."
$carpeta = "D:\Archivos\Documentos\Scripts\Logs"
$archivo = "$carpeta\log_$(Get-Date -Format 'yyyy-MM-dd').txt"

$fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$ping = Test-Connection -ComputerName 8.8.8.8 -Count 1 -ErrorAction SilentlyContinue

if ($ping) {
    $escribirLog = "$fecha - OK - Tiempo de respuesta: $($ping.ResponseTime) ms"
} else {
    $escribirLog = "$fecha - PING FALLO - Sin respuesta"
}

Add-Content -Path $archivo -Value $escribirLog

Write-Host "Finalizado..."