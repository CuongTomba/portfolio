$ErrorActionPreference = "Stop"

$magick = Get-Command magick -ErrorAction SilentlyContinue
if (-not $magick) {
    throw "ImageMagick non e' installato. Installa ImageMagick e rilancia questo script per generare WebP e AVIF."
}

$sourceRoots = @("assets", "photos")
$images = Get-ChildItem -Path $sourceRoots -Recurse -File -Include *.jpg, *.jpeg, *.JPG, *.JPEG

foreach ($image in $images) {
    $webp = Join-Path $image.DirectoryName ($image.BaseName + ".webp")
    $avif = Join-Path $image.DirectoryName ($image.BaseName + ".avif")

    & $magick.Source $image.FullName -auto-orient -strip -resize "2400x2400>" -quality 82 $webp
    & $magick.Source $image.FullName -auto-orient -strip -resize "2400x2400>" -quality 58 -define heic:speed=4 $avif
}

Write-Host "Conversione completata: WebP e AVIF generati accanto ai JPEG originali."
