class AutoincrementUsers < ActiveRecord::Migration[6.0]
  def change
    execute 'ALTER TABLE usuarios drop idusuario'
    execute 'ALTER TABLE usuarios add idusuario smallint NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY'
  end
end
