param($item, $source, $destination)

if($null -eq $source -or $null -eq $destination -or $null -eq $item){
    echo "You need the following parameters:
          [*] item: the item to be copied.
          [*] source: the root path where is located the item.
          [*] destination: the location where the item will be pasted."
}
if($null -ne $source -and $null -ne $destination)
{
    Get-ChildItem -Path $source -Filter $item -File -Recurse | ForEach-Object {
    $newName = '{0}_{1}_{2}' -f $_.Directory.Parent.Name, $_.Directory.Name, $_.Name
    $_ | Copy-Item -Destination (Join-Path -Path $destination -ChildPath $newName)
    }
}
