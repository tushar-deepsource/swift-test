unit_tests:
	swift test --enable-code-coverage --show-codecov-path
	mkdir -p codecov
	xcrun llvm-cov export --ignore-filename-regex='(.build|Tests)[/\\].*' -format="lcov" .build/x86_64-apple-macosx/debug/SwiftTestPackageTests.xctest/Contents/MacOS/SwiftTestPackageTests -instr-profile .build/debug/codecov/default.profdata > codecov/info.lcov
	genhtml codecov/info.lcov --output-directory codecov
