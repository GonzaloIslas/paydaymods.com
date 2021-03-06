if not ThirdPerson.settings.enabled then
  return
end

local enter_original = PlayerDriving.enter
function PlayerDriving:enter(...)
  if self._unit == ThirdPerson.fp_unit and self._unit:camera():third_person() then
    self._was_in_tp = true
    self._unit:camera():toggle_third_person()
  end
  return enter_original(self, ...)
end

local exit_original = PlayerDriving.exit
function PlayerDriving:exit(...)
  if self._unit == ThirdPerson.fp_unit and self._was_in_tp and self._unit:camera():first_person() then
    self._was_in_tp = nil
    self._unit:camera():toggle_third_person()
  end
  return exit_original(self, ...)
end