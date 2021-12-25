require('libs.Jayak.Core.Class')

Doorman = Class:extend({ __name = 'Doorman' })

function Doorman:new(whitelist, detector, transceivers)
    Doorman.__super.new(self)

    self.__state.whitelist = whitelist
    self.__state.detector = detector
    self.__state.transceivers = transceivers
end

function Doorman:work()
    while true do
        local seesPlayer = false

        for _, name in pairs(self.__state.whitelist) do
            if self.__state.detector:canSee(name) then
                seesPlayer = true
            end
        end

        for _, transceiver in pairs(self.__state.transceivers) do
            if seesPlayer then transceiver:on() else transceiver:off() end
        end
    end
end
