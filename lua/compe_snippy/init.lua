local compe = require('compe')
local snippy = require('snippy')

local Source = {}

function Source.new()
    return setmetatable({}, { __index = Source })
end

function Source.get_metadata(_)
    return {
        priority = 50;
        dup = 1,
        menu = '[Snippy]';
    }
end

function Source.determine(_, context)
    return compe.helper.determine(context)
end

function Source.complete(_, context)
    local items = snippy.get_completion_items()

    for _, item in ipairs(items) do
        item.user_data = { compe = item.user_data }
        item.kind = 'Snippet'
        item.menu = nil
    end

    context.callback({
        items = items
    })
end

function Source.documentation(_, args)
    local document = {}
    table.insert(document, '```' .. args.context.filetype)

    local body = (args.completed_item.user_data.compe).snippy.snippet.body
    for _, line in ipairs(body) do
        table.insert(document, line)
    end
    table.insert(document, '```')
    args.callback(document)
end

function Source.confirm(_, context)
    local item = context.completed_item

    snippy.expand_snippet(
        item.user_data.compe.snippy.snippet,
        item.word
    )
end

return Source.new()
