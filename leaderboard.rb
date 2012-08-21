require 'yaml'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

config = YAML.load_file(File.dirname(__FILE__) + '/config.yml')

def leaderboard(project)
  leaderboard = []
  committers = `cd #{project}; git checkout master; git shortlog -nse  --no-merges --since={last.month}`
  committers.split("\n").each do |committer|
    c = committer.split("\t")
    leaderboard.push name: c.last.split('<').first.strip, values: [c.first.to_i]
  end
  leaderboard
end

# Push Committers Leaderboard
ducksboard = Ducksboard.new config['ducksboard_api_key']
ducksboard.push config['leaderboard_widget'], value: { board: leaderboard(config['project_path']) }
