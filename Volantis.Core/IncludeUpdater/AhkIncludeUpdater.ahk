class AhkIncludeUpdater extends IncludeUpdaterBase {
    mainFilePattern := ""
    testFilePattern := "*.test.ahk"
    includeFilename := "Includes.ahk"
    testIncludeFilename := "Includes.test.ahk"

    GetIncludeBuilder(libDir, testBuilder := false) {
        includePattern := testBuilder ?
            this.testFilePattern :
            this.mainFilePattern

        excludePatterns := [
            libDir . "\" . this.includeFilename,
            libDir . "\" . this.testIncludeFilename
        ]

        if (!testBuilder) {
            excludePatterns.Push(this.testFilePattern)
        }

        return AhkIncludeBuilder(libDir, includePattern, true, true, excludePatterns)
    }

    GetIncludeWriter(libDir, testWriter := false) {
        includePath := testWriter ?
            libDir . "\Includes.ahk" :
            libDir . "\Includes.test.ahk"

        return AhkIncludeWriter(includePath)
    }
}
