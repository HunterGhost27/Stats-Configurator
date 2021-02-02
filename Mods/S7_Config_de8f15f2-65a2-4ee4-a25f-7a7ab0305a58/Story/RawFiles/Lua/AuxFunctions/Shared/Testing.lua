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
---@field Results table TestSuite Name
Test = {
    ['Name'] = "",
    ['Results'] = {}
}

---Creates a new TestSuite
---@param object table
---@return TestSuite
function Test:NewSuite(object)
    if not ValidInputTable(object, {'Name'}) then return end
    local object = object or {}
    object = Integrate(self, object)
    return object
end

local Tag = {['Fail'] = "[FAIL]", ['Pass'] = "[PASS]"}

---Unit Test
---@param spec TestSpec
function Test:It(spec)
    if not ValidInputTable(spec, {'fun', 'description'}) then return end
    local results = table.pack(
        xpcall(spec.fun, function(err)
            self.Results[spec.description .. "::`" .. err .. "`"] = Tag.Fail
        end, table.unpack(spec.params)
        )
    )
    local status = table.remove(results, 1); results['n'] = nil
    if not IsEqual(results, spec.expectation) then status = false; self.Results[spec.description] = Tag.Fail end
    if status then self.Results[spec.description] = Tag.Pass end
end

---Displays Test Results
function Test:ShowResults()
    local results = {}
    local md = Ext.LoadFile('S7TestResults.md') or ""
    local header = "Test Results for Suite " .. self.Name .. ":"
    table.insert(results, "# " .. header)
    table.insert(results, "\n|Result|Specification|\n|---|---|")
    Debug:HFPrint(header)
    for desc, success in pairs(self.Results) do
        if success == Tag.Pass then Debug:FPrint(success .. ": " .. desc) else Debug:FError(success .. ": " .. desc) end
        table.insert(results, "|`" .. success .. "`|" .. desc .. "|")
    end
    local testResults = md .. "\n\n" .. table.concat(results, "\n")
    Ext.SaveFile('S7TestResults.md', testResults)
end