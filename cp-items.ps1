param($item, $source, $destination)

if($null -ne $source -and $null -ne $destination)
{
    Get-ChildItem -Path $source -Filter $item -File -Recurse | ForEach-Object {
    $newName = '{0}_{1}_{2}' -f $_.Directory.Parent.Name, $_.Directory.Name, $_.Name
    $_ | Copy-Item -Destination (Join-Path -Path $destination -ChildPath $newName)
}
}