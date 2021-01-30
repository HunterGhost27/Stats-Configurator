
TestGeneral = Test:NewSuite({['Name'] = 'AuxiliaryFunctions/General'})

--  ========
--  IS VALID
--  ========

TestGeneral:It({
    description = 'Should return false for nil',
    fun = IsValid,
    params = {nil},
    expectation = {false}
})
TestGeneral:It({
    description = 'Should return false for 0',
    fun = IsValid,
    params = {0},
    expectation = {false}
})
TestGeneral:It({
    description = 'Should return true for 1',
    fun = IsValid,
    params = {1},
    expectation = {true}
})
TestGeneral:It({
    description = 'Should Fail',
    fun = IsValid,
    params = {999},
    expectation = {false}
})
TestGeneral:It({
    description = 'Should return false for empty string',
    fun = IsValid,
    params = {""},
    expectation = {false}
})
TestGeneral:It({
    description = 'Should return false for empty table',
    fun = IsValid,
    params = {0},
    expectation = {false}
})
TestGeneral:It({
    description = 'Should return true for function',
    fun = IsValid,
    params = {function() return 'Test' end},
    expectation = {true}
})

TestGeneral:Results()