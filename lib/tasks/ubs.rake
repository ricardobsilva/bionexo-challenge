require 'csv'

namespace :ubs do
  desc "Import Basic Health Unit data"
  task import: :environment do
    def convert_value_to_integer(value)
      return 1 if value == "Desempenho mediano ou  um pouco abaixo da média"
      return 2 if value == "Desempenho acima da média"
      return 3 if value == "Desempenho muito acima da média"
    end

    file = File.read('documentation/ubs.csv')
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      basic_health_unit = row.to_hash
      unless basic_health_unit.to_hash.values.include?(nil)
        BasicHealthUnit.create!( name: row['nom_estab'],
                                 address: row['dsc_endereco'] + ' ' + row['dsc_bairro'],
                                 city: row['dsc_cidade'],
                                 phone: row['dsc_telefone'],
                                 lat: row['vlr_latitude'],
                                 long: row['vlr_longitude'],
                                 size: convert_value_to_integer(row['dsc_estrut_fisic_ambiencia']),
                                 adaptation_for_seniors: convert_value_to_integer(row['dsc_adap_defic_fisic_idosos']),
                                 medical_equipment: convert_value_to_integer(row['dsc_equipamentos']),
                                 medicine: convert_value_to_integer(row['dsc_medicamentos']))
      end
    end
  end
end
