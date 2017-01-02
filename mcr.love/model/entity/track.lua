local track_entity = { }

track_entity.construct = function(code)
    local self = { }

    self.code = code
    self.bit = util.loadTrack(code)

    return self
end

track_entity.new = function(code)
    local self = track_entity.construct(code)

    return self
end

return track_entity
