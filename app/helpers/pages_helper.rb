module PagesHelper
  def colorForAmount(amount)
    if amount < 0
      'red'
    elsif amount > 0
      'green'
    else
      ''
    end
  end

  def brightColorForAmount(amount)
    if amount < 0
      'brightRed'
    elsif amount > 0
      'brightGreen'
    else
      ''
    end
  end
end
