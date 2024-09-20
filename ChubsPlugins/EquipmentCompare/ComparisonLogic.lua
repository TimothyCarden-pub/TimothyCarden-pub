-- ComparisonLogic.lua
ComparisonLogic = class();

-- Constructor
function ComparisonLogic:Constructor()
    -- Initialize any data or properties required for comparison
end

-- Function to compare two items
function ComparisonLogic:CompareItems(item1, item2)
    local results = {};
    
    -- Example comparison logic for item stats
    results.nameComparison = item1:GetName() .. " vs " .. item2:GetName();
    results.statComparison = {};

    local statTypes = { Turbine.Gameplay.Stat.Might, Turbine.Gameplay.Stat.Agility, Turbine.Gameplay.Stat.Vitality };
    
    for _, statType in ipairs(statTypes) do
        local statName = Turbine.Gameplay.Stat.GetName(statType);
        local item1StatValue = item1:GetStat(statType);
        local item2StatValue = item2:GetStat(statType);
        
        local comparisonText = string.format("%s: %d vs %d", statName, item1StatValue, item2StatValue);
        table.insert(results.statComparison, comparisonText);
    end

    -- Add any other stats or comparisons as needed
    return results;
end

-- Function to format the comparison result for display
function ComparisonLogic:FormatComparisonResult(results)
    local comparisonText = results.nameComparison .. "\n\n";

    for _, statComparison in ipairs(results.statComparison) do
        comparisonText = comparisonText .. statComparison .. "\n";
    end

    return comparisonText;
end
