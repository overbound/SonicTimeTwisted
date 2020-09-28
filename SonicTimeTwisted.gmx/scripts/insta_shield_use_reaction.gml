enemy=other;
if script_exists(enemy.reaction_script)
    with (objLevel.player[0]) {
        script_execute(other.enemy.reaction_script,other.enemy);
    }
