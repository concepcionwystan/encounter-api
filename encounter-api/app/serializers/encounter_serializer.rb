class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :patientname, :workername, :assessment, :meetdate
end
