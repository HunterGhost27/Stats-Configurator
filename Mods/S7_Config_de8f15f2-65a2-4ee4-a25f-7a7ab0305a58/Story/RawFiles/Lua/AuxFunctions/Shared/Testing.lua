--  ===========
--  PERFORMANCE
--  ===========

---Measures execution time of function
---@param funcName string
---@param fun function
---@return number elapsed
---@return string funcName
function Snapshot(funcName, fun, ...)
    local start = Ext.MonotonicTime()
    xpcall(fun, function() end, ...) 
    local finish = Ext.MonotonicTime()
    local elapsed = finish - start
    local funcName = funcName or tostring(fun)
    return elapsed, funcName
end

--  ============
--  UNIT TESTING
--  ============

local Tag = {
    ['FAIL'] = "❌",
    ['PASS'] = "✅"
}

---@class TestSpec @Test Specification
---@field fun function Function to test
---@field params any[] Array of paramaters
---@field expectation any[] Array of expected results
---@field message string Assert message
---@field description string Description of test

---@class TestSuite
---@field Name string TestSuite Name
---@field Results table TestSuite Name
TestSuite = {
    ['Name'] = "",
    ['Results'] = {},
}

---@class Tests
Tests = {
    ['Passed'] = 0,
    ['Failed'] = 0
}

---Creates a new TestSuite
---@param object table
---@return TestSuite
function TestSuite:New(object)
    if not object.Name then return end
    local object = object or {}
    object = Integrate(self, object)
    table.insert(Tests, object)
    return object
end

---Unit Test
---@param spec TestSpec
function TestSuite:It(spec)
    if not spec.fun or not spec.description then return end
    local elapsed = Snapshot(nil, spec.fun, table.unpack(spec.params))
    local message = spec.message
    local results = table.pack(
        xpcall(spec.fun, function(err)
            message = err and "`" .. err .. "`" or nil
            self.Results[spec.description .. "~~" .. tostring(elapsed) .. "~~" .. message] = Tag.FAIL
        end, table.unpack(spec.params)
        )
    )
    local status = table.remove(results, 1); results['n'] = nil
    if not IsEqual(results, spec.expectation) then
        status = false
        message = message or ("`Unexpected Results: " .. table.concat(results, ", ") .. "`")
        self.Results[spec.description .. "~~" .. tostring(elapsed) .. "~~" .. message] = Tag.FAIL
        Tests.Failed = Tests.Failed + 1
    end
    if status then
        self.Results[spec.description .. "~~" .. tostring(elapsed) .. "~~Success"] = Tag.PASS
        Tests.Passed = Tests.Passed + 1
    end
end

function ClearTestResults() Ext.SaveFile("S7TestResults.md", "") end

function ShowTestResults()
    local md = Ext.LoadFile('S7TestResults.md') or ""
    local report = "# Test Summary 📊\n\n"
   report = report .. "`" .. tostring(Tests.Passed) .. "` ✔ Tests `Passed`" .. "   |   "
   report = report .. "`" .. tostring(Tests.Failed) .. "` ❌ Tests **Failed**" .. "\n"

    md = md .. report .. "\n"

    for _, suite in ipairs(Tests) do
        local header = "## 🧪Test Results for Suite: `" .. suite.Name .. "`\n\n"
       local tableHeader = "|Result|Specification|Time|Details|\n|:--:|---|---|---|"
       local table = "" 
       for desc, success in pairs(suite.Results) do
        local desc, time, message = Disintegrate(desc, "~~")
            table = table .. "\n|" .. success .. "|" .. desc .. "|" .. tostring(time) .. "ms |" .. message .. "|"
        end
        md = md ..header .. tableHeader .. table .. "\n"
    end
    Ext.SaveFile('S7TestResults.md', md)
end