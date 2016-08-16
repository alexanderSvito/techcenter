module ApplicationHelper

  def user_url user
    "/user/#{user.id}"
  end

  def cart_url cart
    "/cart/#{cart}"
  end

  def item_url item
    "/item/#{item}"
  end 

  def get_address
    "г. #{params[:city]}, ул. #{params[:street]}, д. #{params[:building]}, кв. #{params[:flat]||"не указана"}"
  end

  def format_phone str
    "+7(#{str[0..2]})#{str[3..5]}-#{str[6..7]}-#{str[8..9]}"
  end

  def translate name
    dict = {"printer" => "Принтеры","mfu" => "МФУ","scanner" => "Сканнеры","paper" => "Бумага","cartridge" => "Картриджи","shredder" => "Шредеры","laminator" => "Ламинаторы","bookbinder" => "Переплётные машины","other" => "Расходные материалы"}
    dict[name]
  end

  def readable str
    str.gsub(/\|\%\|(?<first>[А-яA-z0-9 ]+?)\|\%\|/, "!"+'\k<first>'+"\r\n").gsub(/\|\!\|/, "\r\n").gsub(/\:/, ": ").gsub("|%|", "")
  end

  def storeable str
    (str.gsub(/\!(?<first>[А-яA-z0-9 ]+?)\r\n/, "|%|" +'\k<first>' +"|%|").gsub(/\r\n/, "|!|").gsub(/\: /, ":").gsub("\n", "") + "|%|").gsub("|!||%|","|!||%||%|" )
  end

  def hashify str
    {}.tap do |x|
      str.scan(/\|\%\|(.+?)\|\%\|(.+?)\|\%\|/).each do |t|
        p t
        x[t[0]] = {}.tap do |r|
          t[1].split("|!|").each do |m|
            r[m.split(":")[0]] = m.split(":")[1]
          end
        end
      end
    end
  end
end
