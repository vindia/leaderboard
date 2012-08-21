# Leaderboard, a git leaderboard for Ducksboard

This little script lets you automatically push the top committers of your project to your own widget on your [Ducksboard] dashboard.

## Usage
You need to create a 'leader board' type widget on your Ducksboard dashboard first. Then all you need to do is copy `config.example.yml` to `config.yml` and edit it appropriately:

    ducksboard_api_key: YOUR_API_KEY
    leaderboard_widget: 12345
    project_path:       /path/to/your/project
    
### How to handle authors with different aliases
It is wise to use a `.mailmap` file to merge committers with multiple entries in the commit list into one (e.g. "S. Jobs", "Steve Jobs" and "Steven P. Jobs" would become just "Steve Jobs"). Check out the [mailmap documentation] for the exact usage of this.
    
## Set up automatic push
The easiest way to set up automatic pushing of your data is to run this script as a cronjob on your server or local machine. Pick a time frame that suits your project.

You could also set this script up using [git-hooks], like a post-receive hook, so it pushes your data every time your repository receives a push.

## Caveats
* Only commits on the master branch are counted (i.e. no aggregates on commits on branches that have not been merged into master yet)
* It assumes a clean working directory. This might be sub optimal in a development environment
    
[Ducksboard]: http://ducksboard.com    
[mailmap documentation]: http://www.kernel.org/pub/software/scm/git/docs/git-shortlog.html#_mapping_authors
[git-hooks]: http://git-scm.com/book/en/Customizing-Git-Git-Hooks