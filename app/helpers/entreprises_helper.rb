module EntreprisesHelper
  def afficher_organigramme(entreprise)
    content_tag(:div, class: "entreprise") do
      concat content_tag(:h3, entreprise.nom)
      concat content_tag(:p, "Taux de détention: #{entreprise.taux_detention}%")
      # Afficher d'autres informations si nécessaire...

      if entreprise.filiales.any?
        concat content_tag(:div, class: "filiales") do
          entreprise.filiales.each do |f|
            concat afficher_organigramme(f)
          end
        end
      end
    end
  end
end
