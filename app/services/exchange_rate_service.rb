require 'faraday'
require 'json'

class ExchangeRateService
  API_URL = "http://data.fixer.io/api/latest"

  # Tasas de rescate estáticas en caso te quedes sin créditos en Fixer.io
  # Todo basado en 1 EUR
  FALLBACK_RATES = {
    'EUR' => 1.0,
    'USD' => 1.08,
    'PEN' => 4.05,
    'GBP' => 0.86,
    'MXN' => 18.15,
    'CLP' => 1005.0
  }

  def self.convert(amount, from_currency, to_currency)
    return amount if from_currency == to_currency

    # Obtenemos todo el diccionario de monedas
    rates = get_all_rates
    
    # Buscamos la tasa o usamos la de rescate si Fixer falló
    rate_from = rates[from_currency] || FALLBACK_RATES[from_currency] || 1.0
    rate_to = rates[to_currency] || FALLBACK_RATES[to_currency] || 1.0

    (amount * (rate_to / rate_from)).round(2)
  end

  def self.get_all_rates
    # ESTO ES MAGIA PARA TU CAPA GRATUITA:
    # Trae TODAS las monedas en un solo request y las guarda por 12 horas.
    # Así, tu app solo gastará 2 peticiones al mes por cada día que la uses.
    Rails.cache.fetch("fixer_all_rates_v2", expires_in: 12.hours) do
      fetch_from_api
    end
  end

  private

  def self.fetch_from_api
    api_key = ENV['FIXER_API_KEY']
    
    response = Faraday.get(API_URL) do |req|
      req.params['access_key'] = api_key
    end

    if response.success?
      data = JSON.parse(response.body)
      if data['success']
        data['rates']
      else
        Rails.logger.error("Fixer devolvió error: #{data['error']['info']}")
        FALLBACK_RATES
      end
    else
      Rails.logger.error("La API de Fixer no responde correctamente")
      FALLBACK_RATES
    end
  rescue StandardError => e
    Rails.logger.error("Excepción conectando a Fixer: #{e.message}")
    FALLBACK_RATES
  end
end