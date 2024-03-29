properties{
    # Commons
    $build_config = "Release"
    $project_name = "PsakeSample"
}

properties{
    # Directories
    $baseDir  = resolve-path ..
    $buildDir = "$baseDir\build"
    $workDir  = "$baseDir\work"
    $deliDir  = "$baseDir\deliverable"
}

properties{
    # Executables
    $tools_unittest = "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\MSTest.exe"
}

properties{
    # Files
    $solution_file    = "$baseDir\PsakeSample.sln"
    $testresult_file  = "TestResults.trx"
    $ut_dll           = "PsakeSample\PsakeSample.UT.dll"
    $web_project_file = "PsakeSample\PsakeSample.csproj"
}

# Tasks
task default -depends Full
task Full -depends Clean, Build, Test, Package
task PsakeSample-Build -depends Clean, Build, Test
task PsakeSample-Packaging -depends Clean, Package


# Detailed Tasks

#-----------------------------------------------------------
# ビルドのために利用するディレクトリーを削除、作成するタスク
#-----------------------------------------------------------
task Clean{
    Set-Location $baseDir
    if(Test-Path -path $workDir){
        del $workDir -Recurse -Force
        del $buildDir -Recurse -Force
        del $deliDir  -Recurse -Force
    }
    New-Item -Path $workDir -ItemType Directory
    New-Item -Path $buildDir -ItemType Directory
    New-Item -Path $deliDir -ItemType Directory
}

#-----------------------------------------------------------
# ビルドするタスク
#-----------------------------------------------------------
task Build{
    Set-Location $baseDir
    Write-Host -ForegroundColor Green "Building"
    exec { msbuild  /p:Configuration=$build_config /p:OutputPath=$workDir\$project_name $solution_file } "Error Build" | out-null
}

#-----------------------------------------------------------
# コンポーネントテストするタスク
#-----------------------------------------------------------
task Test{
    Set-Location $workDir
    Write-Host -ForegroundColor Green "Testing"
    exec { & $tools_unittest /testcontainer:$ut_dll /resultsfile:$testresult_file } "Error running $name tests" | out-null
}

#-----------------------------------------------------------
# 配置用パッケージを作成するタスク
#-----------------------------------------------------------
task Package{
    Set-Location $baseDir
    Write-Host -ForegroundColor Green "Packaging"
    exec { msbuild  /p:Configuration=$build_config  /p:DeployOnBuild=True /p:CreatePackageOnPublish=True $web_project_file } | out-null
}