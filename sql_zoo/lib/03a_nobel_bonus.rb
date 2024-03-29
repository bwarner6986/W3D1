# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT DISTINCT
      nobels.yr
    FROM
      nobels
    WHERE
      (nobels.subject = 'Physics' AND nobels.yr NOT IN (
        SELECT
          nobels.yr
        FROM
          nobels
        WHERE
          nobels.subject = 'Chemistry'
      ));
  SQL
end
