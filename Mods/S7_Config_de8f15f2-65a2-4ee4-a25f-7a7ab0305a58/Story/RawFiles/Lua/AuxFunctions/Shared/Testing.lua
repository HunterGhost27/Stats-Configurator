--  ============
--  UNIT TESTING
--  ============

---@class TestSpec @Test Specifications
---@field fun function Function to test
---@field params table Array of paramaters
---@field expectation table Array of expected results
---@field description string Description of test

---@class TestSuite
---@field Name string TestSuite Name
---@field Failures table Array of fails
---@field Successes table Array of successes
Test = {
    Name = "",
    Failures = {},
    Successes = {},
}

---Creates a new TestSuite
---@param object table
---@return TestSuite
function Test:NewSuite(object)
    if not ValidInputTable(object, {'Name'}) then Debug:Error("Cannot create TestSuite. Invalid input object") return end
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Unit Test
---@param spec TestSpec
function Test:It(spec)
    if not ValidInputTable(spec, {'fun', 'description'}) then return end
    local results = table.pack(
        xpcall(spec.fun, function(err)
            table.insert(self.Failures, spec.description .. ": " .. err)
        end, table.unpack(spec.params)
        )
    )
    local status = table.remove(results, 1)
    results['n'] = nil
    if not IsEqual(results, spec.expectation) then status = false; table.insert(self.Failures, spec.description) end
    if status then table.insert(self.Successes, spec.description) end
end

---Displays Test Results
function Test:Results()
    Write:SetHeader(self.Name)
    Write:NewLine('Failures: ')
    Write:NewLine(table.concat(self.Failures), "\n")
    Write:LineBreak(' ')
    Write:NewLine('Success: ')
    Write:NewLine(table.concat(self.Successes), "\n")
    Debug:HFWarn(Write:Display())
end

