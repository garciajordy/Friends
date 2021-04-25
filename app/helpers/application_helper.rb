module ApplicationHelper
    def messa(mes)
       return "warning" if mes == "notice"
       mes
    end
end
