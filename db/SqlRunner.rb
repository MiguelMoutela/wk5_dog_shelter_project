require('pg')
class SQLRunner

  def self.run( sql, values )
    begin
      db = PG.connect({ dbname: 'bowwow', host: 'localhost', user: 'postgres', password: 'duFfimm0' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
