--  ========
--  IS VALID
--  ========

GeneralTest = Test:NewSuite({['Name'] = 'IsValid'})

GeneralTest:It({
    ['description'] = 'Should return false for nil',
    ['fun'] = IsValid,
    ['params'] = {nil},
    ['expectation'] = {false}
})

GeneralTest:It({
    ['description'] = 'Should return false for 0',
    ['fun'] = IsValid,
    ['params'] = {0},
    ['expectation'] = {false}
})

GeneralTest:It({
    ['description'] = 'Should return false for empty string',
    ['fun'] = IsValid,
    ['params'] = {""},
    ['expectation'] = {false}
})

GeneralTest:It({
    ['description'] = 'Should return false for empty table string',
    ['fun'] = IsValid,
    ['params'] = {"{}"},
    ['expectation'] = {false}
})

GeneralTest:It({
    ['description'] = 'Should return false for empty array string',
    ['fun'] = IsValid,
    ['params'] = {"[]"},
    ['expectation'] = {false}
})

GeneralTest:It({
    ['description'] = 'Should return false for empty table',
    ['fun'] = IsValid,
    ['params'] = {{}},
    ['expectation'] = {false}
})

GeneralTest:ShowResults()

--  ============
--  DISINTEGRATE
--  ============

GeneralTest = Test:NewSuite({['Name'] = 'Disintegrate'})

GeneralTest:It({
    ['description'] = "Should split a table into its constituting elements",
    ['fun'] = Disintegrate,
    ['params'] = {
        {
            "Hello",
            "Goodbye",
            42,
            {
                ['NewTableKey'] = "YOLO",
                "Level2"
            }
        }
    },
    ['expectation'] = {
        "Hello",
        "Goodbye",
        42,
        {
            ['NewTableKey'] = "YOLO",
            "Level2"
        }
    }
})

GeneralTest:It({
    ['description'] = 'Should split a string based on a given separator',
    ['fun'] = Disintegrate,
    ['params'] = {"A/BC/123/XY-Z", "/"},
    ['expectation'] = {"A", "BC", "123", "XY-Z"}
})

GeneralTest:It({
    ['description'] = 'Should split a string based on spaces if no separator has been provided',
    ['fun'] = Disintegrate,
    ['params'] = {"A BC 123 XY-Z", " "},
    ['expectation'] = {"A", "BC", "123", "XY-Z"}
})

GeneralTest:It({
    ['description'] = 'Should split not split a string if no separator is provided',
    ['fun'] = Disintegrate,
    ['params'] = {"A BC 123 XY-Z", ""},
    ['expectation'] = {"A BC 123 XY-Z"}
})

GeneralTest:It({
    ['description'] = 'Should split a number into whole and decimal parts (will fail - hanvent implemented)',
    ['fun'] = Disintegrate,
    ['params'] = {5.62},
    ['expectation'] = {5, 0.62}
})

GeneralTest:ShowResults()