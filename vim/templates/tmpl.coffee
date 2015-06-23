class window.ClassName extends SuperClass

    # Static variables
    @staticVar = 0
    
    # fields
    _fieldVar_1 = false
    _fieldVar_2 = ''
    _fieldVar_3 = null
    
    # constructor
    constructor: (args)->
        _fieldVar_1 = true
        _fieldVar_2 = args.foo
        _fieldVar_3 = args.bar
        # do something...

    # private methods
    privateFunc = (value)->
        if _fieldVar
            msg = "Hello, #{value}!"
        else
            msg = "Goodbye, #{value}"
        msg
    
    # public methods
    publicFunc: (target)->
        privateFunc.call @, target
