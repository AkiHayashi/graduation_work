$("#number").keypad({
  layout: ['789','456','123','-0'+$.keypad.BACK],
  keypadOnly: false
}).keypad('option', 'backText', '⌫');