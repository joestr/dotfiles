function Use-JoelSetOfficeGnuGpgOL {
  $isOfficeInstalled = Test-Path "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\resiliency\addinlist\"

  if ($isOfficeInstalled -ne $true) {
    return
  }

  $isGnuGpgOLpresent = (Get-ItemProperty -Name GNU.GpgOL -Path "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\resiliency\addinlist\" -ErrorAction Ignore) -ne $null

  if ($isGnuGpgOLpresent -eq $true) {
    return
  }

  New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\resiliency\addinlist\" -Name "GNU.GpgOL" -Value "1" -PropertyType String -Force
}

function Use-JoelViewCodeSigningCerts {
  Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert | `
    Select-Object Thumbprint,Subject,Issuer,NotAfter,NotBefore | `
    Where-Object NotAfter -GT (Get-Date)
}

function Use-JoelGetChangeId {
  $localTempPath = (Get-Item -Path $env:TEMP).FullName
  openssl rand -base64 512 > $localTempPath/temp-change-id-gen.txt
  $rand1 = (Get-FileHash -Algorithm SHA1 -Path $localTempPath/temp-change-id-gen.txt).Hash.ToLower()
  Remove-Item -Path $localTempPath/temp-change-id-gen.txt
  Write-Host "Change-Id: I$rand1"
}

function Use-JoelSignWindowsFile {
  param(
    [string] $CertSha1,
    [Path] $File
  )

  & 'C:\Program Files (x86)\Windows Kits\10\bin\10.0.22621.0\x64\signtool.exe' sign `
    /sha1 $CertSha1 `
    /tr http://ts.harica.gr `
    /td SHA256 `
    /fd SHA256 `
    $File
}

function Use-JoelGet512BitIdentifier() {
  $rand=(openssl rand -base64 64)
  $rand | ForEach-Object { $idgen += $_ }
  return $idgen
}

function Use-JoelGeneratePassword([int] $Length) {
  $rand=(openssl rand -base64 $Length)
  $rand | ForEach-Object { $passgen += $_ }
  $passgen = $passgen.Replace("/", "-")
  $passgen = $passgen.Replace("+", ".")
  $passgen = $passgen.Replace("=", "")
  return $passgen.Substring(0,$Length)
}

function Use-JoelGetWin11ComputerInfo {
  $result = @{}
  $result.FreeMemoryGiB = (Get-CimInstance Win32_PerfFormattedData_PerfOS_Memory | Select-Object -ExpandProperty AvailableBytes)/1024/1024/1024
  $result.PhysicalMemoryGiB = (Get-CimInstance WIN32_ComputerSystem | select -expandProperty TotalPhysicalMemory)/1024/1024/1024
  $MemoryInfo = $(wmic memorychip get manufacturer,partnumber,SerialNumber,Capacity)
  Write-Host $MemoryInfo
  return $result
}
