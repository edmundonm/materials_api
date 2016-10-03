class Material
  require 'csv'

  FILE_PATH = "/Users/mundo/Sites/materials-api/materials_api/public/datasource.csv"


  def self.extract_materils(params)
    # evaluate_parameters
    material_distribution = []
    CSV.read( Material::FILE_PATH, { headers: true, header_converters: :symbol }).each do |row|
      material_distribution << {materials: extract_material_percentages(row[:materials]),
                              # category_id: row[:category_id],
                              # brand_id: row[:brand_id],
                              count: row[:count]} if row[:category_id].to_i == params[:category_id].to_i and
                                    row[:brand_id].to_i == params[:brand_id].to_i
    end
    material_distribution.sort!{|b,a| a[:count] <=> b[:count]}
  end

  def self.extract_material_percentages(materials_string)
    materials = materials_string.split('|')
    materials
  end
end
