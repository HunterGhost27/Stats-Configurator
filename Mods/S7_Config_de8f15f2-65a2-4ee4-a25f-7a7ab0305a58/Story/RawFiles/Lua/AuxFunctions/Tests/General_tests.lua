--  ========
--  IS VALID
--  ========

Test = TestSuite:New({['Name'] = 'IsValid'})

Test:It({
    ['description'] = 'Should return false for nil',
    ['fun'] = IsValid,
    ['params'] = {nil},
    ['expectation'] = {false}
})

Test:It({
    ['description'] = 'Should return false for 0',
    ['fun'] = IsValid,
    ['params'] = {0},
    ['expectation'] = {false}
})

Test:It({
    ['description'] = 'Should return false for empty string',
    ['fun'] = IsValid,
    ['params'] = {""},
    ['expectation'] = {false}
})

Test:It({
    ['description'] = 'Should return false for empty table string',
    ['fun'] = IsValid,
    ['params'] = {"{}"},
    ['expectation'] = {false}
})

Test:It({
    ['description'] = 'Should return false for empty array string',
    ['fun'] = IsValid,
    ['params'] = {"[]"},
    ['expectation'] = {false}
})

Test:It({
    ['description'] = 'Should return false for empty table',
    ['fun'] = IsValid,
    ['params'] = {{}},
    ['expectation'] = {false}
})

--  ============
--  DISINTEGRATE
--  ============

Test = TestSuite:New({['Name'] = 'Disintegrate'})

Test:It({
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

Test:It({
    ['description'] = 'Should split a string based on a given separator',
    ['fun'] = Disintegrate,
    ['params'] = {"A/BC/123/XY-Z", "/"},
    ['expectation'] = {"A", "BC", "123", "XY-Z"}
})

Test:It({
    ['description'] = 'Should split a string based on spaces if no separator has been provided',
    ['fun'] = Disintegrate,
    ['params'] = {"A BC 123 XY-Z", " "},
    ['expectation'] = {"A", "BC", "123", "XY-Z"}
})

Test:It({
    ['description'] = 'Should split a number into whole part and (2) decimal places',
    ['fun'] = Disintegrate,
    ['params'] = {5.62},
    ['expectation'] = {5, 0.62}
})
