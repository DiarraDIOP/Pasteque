function Calculator()
{
    that 		= this,
    this.field  = "input#number",
    this.button = "#body .buttons",
    this.init   = false,

    this.run = function()
    {
        $(this.button).click(function() {
            var value = $(this).html();

            if (that.init == false)
            {
                $(that.field).val("");
                that.init = true;
            }

            if (value != "Encaisser")
                $(that.field).val($(that.field).val() + value);

            that.dispatcher(value);
        });
    },

    this.dispatcher = function(value)
    {
        if ($(this.field).val().indexOf("C") != -1)
            this.operation(value, "C");
        if ($(this.field).val().indexOf("X") != -1)
            this.operation(value, "X");
    },

    this.operation = function(value, symbol)
    {
        var numbers = $(this.field).val().split(symbol),
            result;

        if (symbol == "C")
            result = "";
        else if (symbol == "X")
            result = numbers[0] * numbers[1];

        result = Math.round((result) * 100) / 100;

        if (numbers.length > 1)
        {
            if (value == "Encaisser")
                $(this.field).val(result);
            else if (numbers.length > 2)
                $(this.field).val(result + symbol);
        }
    };
}