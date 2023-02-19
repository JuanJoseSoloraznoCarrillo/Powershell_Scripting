param($item, $path, $verbose=$true)

if($null -ne $item -and $null -eq $path)
{
    Write-Host "
    ------------------- Searching for < $item > -----------------------
    --------- you can stop the search using 'ctrl+c' ------------------   
    
    searching ..."
    # start the search 
    $path = Get-ChildItem -Filter $item -Recurse 2> $null
    
}elseif ($null -ne $item -and $null -ne $path) {
    Write-Host "
    ------------------- Searching for < $item > -----------------------
    --------- you can stop the search using 'ctrl+c' ------------------   
    
    searching ..."
    # start the search
    $path = Get-ChildItem -Path $path -Filter $item -Recurse 2> $null
}else{
    Write-Host '
    '
    help $MyInvocation.MyCommand.Name
    Write-Host "Parameters: 
    -item:: the file that you want to search.
    -path:: the location where you want to search.
    -verbose:: it shows the information search."
}


if($verbose -and $path)
{
    $all_paths = $path.FullName
    Set-Clipboard $all_paths
    Write-Host "Found at:"
    foreach($fpath in $all_paths)
    {
        Write-Host " $fpath"
        Write-Host " "
    }
}elseif($path)
{
    Set-Clipboard $path.FullName
    Write-Host "All was copied on clipboard !!!"
}else{
    Write-Host " $item NOT FOUND !!!!"
}