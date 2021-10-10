# The Portal scale of puzzle elegance

Game (esp puzzle game) elegance: the Portal scale.
Aristotles and Mashy Spike Plates
* A game should make it clear whether it's "save frequently in case you don't like what happens", or "fail often, fail
  fast, and reset to try again", or "if you got into that mess by platforming, you can platform your way out".
* Give examples of what's worth +1 and what's worth -1
  - Mechanic introduction
  - Mechanic reuse
  - Puzzle element visibility
  - Discoverability
  - Gameplay/story integration
  - Puzzle isolation
    - Knowing when something is done and finished (eg a step that mandates that a barrier close, or a clear one-way drop)
    - Clear boundaries on the travel area
* Very few game design decisions are *wrong* per se, but inconsistency creates inelegance.
* Once a mechanic is introduced, keep it
* "I was just dumb" is a partial amelioration at best. An elegant puzzle should be solvable even if you're dumb.
  - "I was just blind" may indicate a visibility or discoverability problem
* Caveats
  - Not knowing the effect of frobbing a thing is usually inelegant, but subtle changes to drive you forward are fine

Mechanics
* !ari ==> Aristotles $aristotles$
  - !ari 1 ==> add an Aristotle
  - !ari .5 ==> add half an Ari
  - !ari -.5 ==> undo adding half an Ari (completely different from adding half an MSP)
  - !ari ==> show current score, don't make changes
  - Alias to !aristotle !aristotles
* !msp ==> Mashy Spike Plates $spikes$
  - !msp 1 ==> add a Mashy Spike Plate, etc, parallel to above
  - Since fractions are supported, can't use counter code. Should this change? For now, !calc.
  - Alias to !mashy !spike !spikes
* !pp ==> Show current Portal Points
  - Alias to !portal !portalpoints
* !game ==> Show or set current game
  - Every other command will name the current game. If I forget to clear the points, it'll be obvious.
  - !game Foo ==> error
  - !game set Foo ==> show current stats, change $ppgame$, clear Ari/Mashy score
  - Alias to !setgame
