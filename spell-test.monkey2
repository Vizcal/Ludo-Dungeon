Class Projectile
    Field speed:float
    Field direction:float

    Field aoe:bool                = false
    Field damage:bool             = true
    Field dot:bool                = true
    Field collide

    Field burnDamage:float = 1
    Field explosionData:ExplosionData
End

Class ExplosionData
  Field big:float
  Field clouds:bool = false
End

positonh = 10,10
explosion 10,20
explosion radius = 15

CheckTakeDamage
positonh xy = 10,10

explosion 10,20
explosion radius = 9

CheckNotTakeDamage



Class InstantSpell

End

Function UpdateLoop()
  keys = KeyboardInput()
  For local slot:= eachin slots
    If slot.activated Then AbilityBar(slot.ability)
  next
End

Function KeyboardInput:[]()
  If keydown(KEY_A) Then SetToZero(player)
End

Function RunProjectileBehaviorOnHit:Void(projectile:Projectile, world:World)
  local hasHitSpellRefect:bool = false
  If projectile.aoe
    local inAoe:List<entity> = world.allEntetiesWithin(projectile.position, projectile.aoeRadius)
    inAoe.
  End
  If projectile.dot Then RunProjectileBehaviorDot(projectile)
End

Function RunExplosionOnThrow:Void(projectile:Projectile)

End

Function AbilityActivate:Void(ability:Ability)
  Select ability.type
    Case projectile

    Case InstantSpell

  End
End

Function TestExplosionOnThrow:Void()
  local health = 10
  local projectile:= new Projectile
  ' set a projectile with 5 damage as a test
  RunExplosionOnThrow(projectile)
  If health <> 5 then Print "Health ERROR - health is "+health+" but exptected 5"
End

Function RunExplosionOnThrow:Void(projectile:Projectile)

End

Function UpdateAllSpells:Void(lista,listb,listc,listd,listb,listc,listd,listb,listc,listd,listb,listc,listd,listb,listc,listd)

End

Function UpdateProjectileSpells:Void(projectiles:TList)
  projectiles.Each(Lambda()

  End)
End

Class DebugDamage implements IEffect
    Method OnHit:Void()
      Print "Got hit! Damage "+damage
    End
End

Class Damage extends Effect
  Field damage:float
End

Class BurnDamage extends Effect
  Field burnDamage:float
End

Function SetNormalProjectile(spell:Spell)
  spell.range     = true
  spell.ranged    = true
  spell.projectile= true
  spell.damage    = true
End

Enum SpellSize
  Small, Medium, Large
End

'CreateFireball(size.Small)

Function CreateFireball:Spell(size:int=0)
  local spell:= new Spell
  spell             = SetNormalProjectile(spell)
  spell.aoe         = true
  spell.burnDamage  = 1
  return spell
End
