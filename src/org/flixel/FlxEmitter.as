package org.flixel
{
	import flash.geom.Point;
	
	/**
	 * <code>FlxEmitter</code> is a lightweight particle emitter.
	 * It can be used for one-time explosions or for
	 * continuous fx like rain and fire.  <code>FlxEmitter</code>
	 * is not optimized or anything; all it does is launch
	 * <code>FlxSprite</code> objects out at set intervals
	 * by setting their positions and velocities accordingly.
	 * It is easy to use and relatively efficient, since it
	 * automatically recycles its sprites and/or kills
	 * them once they've been launched.
	 */
	public class FlxEmitter extends FlxCore
	{
		/**
		 * The minimum possible velocity of a particle.
		 * The default value is (-100,-100).
		 */
		public var minVelocity:Point;
		/**
		 * The maximum possible velocity of a particle.
		 * The default value is (100,100).
		 */
		public var maxVelocity:Point;
		/**
		 * The minimum possible angular velocity of a particle.  The default value is -360.
		 * NOTE: rotating particles are more expensive to draw than non-rotating ones!
		 */
		public var minRotation:Number;
		/**
		 * The maximum possible angular velocity of a particle.  The default value is 360.
		 * NOTE: rotating particles are more expensive to draw than non-rotating ones!
		 */
		public var maxRotation:Number;
		/**
		 * Sets the <code>acceleration.y</code> member of each particle to this value on launch.
		 */
		public var gravity:Number;
		/**
		 * Sets the x and y drag of each particle to this value on launch.
		 */
		public var drag:Number;
		/**
		 * How long to wait between particle emissions.
		 * Set this to a negative number to launch all particles at once.
		 * Negative value defines the lifespan of the particle.
		 * E.g. a delay of -1 means all the particles launch immediately,
		 * but disappear after 1 second.
		 */
		public var delay:Number;
		/**
		 * Internal list of all the particles.
		 */
		protected var _sprites:Array;
		/**
		 * Internal helper for deciding when to launch particles or kill them.
		 */
		protected var _timer:Number;
		/**
		 * Internal marker for where we are in <code>_sprites</code>.
		 */
		protected var _particle:uint;
		
		/**
		 * Creates a new <code>FlxEmitter</code> object at a specific position with a certain timing.
		 * WARNING: Does not automatically generate particles or attach particles!
		 * 
		 * @param	X			The X position of the emitter.
		 * @param	Y			The Y position of the emitter.
		 * @param	Delay		The initial emitter timing.
		 */
		public function FlxEmitter(X:Number=0, Y:Number=0, Delay:Number=0.1)
		{
			super();
			
			visible = false;
			x = X;
			y = Y;
			width = 0;
			height = 0;
			
			minVelocity = new Point(-100,-100);
			maxVelocity = new Point(100,100);
			minRotation = -360;
			maxRotation = 360;
			gravity = 400;
			drag = 0;
			delay = Delay;
			
			_sprites = null;

			kill();
		}
		
		/**
		 * This function attaches an existing array of sprites to this particle emitter.
		 * 
		 * @param	Sprites			A pre-configured FlxArray of FlxSprite objects for the emitter to use.
		 * 
		 * @return	This FlxEmitter instance (nice for chaining stuff together, if you're into that).
		 */
		public function loadSprites(Sprites:Array):FlxEmitter
		{
			_sprites = Sprites;
			var sl:uint = _sprites.length;
			for(var i:uint = 0; i < sl; i++)
				_sprites[i].scrollFactor = scrollFactor;
			kill();
			if(delay > 0)
				restart();
			return this;
		}
		
		/**
		 * This function generates a new array of sprites to attach to the emitter.
		 * 
		 * @param	Graphics		If you opted to not pre-configure an array of FlxSprite objects, you can simply pass in a particle image or sprite sheet.
		 * @param	Quantity		The number of particles to generate when using the "create from image" option.
		 * @param	Multiple		Whether the image in the Graphics param is a single particle or a bunch of particles (if it's a bunch, they need to be square!).
		 * @param	Parent			A FlxLayer object that you can attach things to instead of the current state.
		 * 
		 * @return	This FlxEmitter instance (nice for chaining stuff together, if you're into that).
		 */
		public function createSprites(Graphics:Class, Quantity:uint=50, Multiple:Boolean=true, Parent:FlxLayer=null):FlxEmitter
		{
			var i:uint;
			var sl:uint;
			_sprites = new Array();
			for(i = 0; i < Quantity; i++)
			{
				if(Multiple)
				{
					var s:FlxSprite = new FlxSprite();
					s.loadGraphic(Graphics,true);
					s.randomFrame();
					_sprites.push(s);
				}
				else
					_sprites.push(new FlxSprite(0,0,Graphics));
			}
			sl = _sprites.length;
			for(i = 0; i < sl; i++)
			{
				if(Parent == null)
					FlxG.state.add(_sprites[i]);
				else
					Parent.add(_sprites[i]);
				_sprites[i].scrollFactor = scrollFactor;
			}
			kill();
			if(delay > 0)
				restart();
			return this;
		}
		
		/**
		 * A more compact way of setting the width and height of the emitter.
		 * 
		 * @param	Width	The desired width of the emitter (particles are spawned randomly within these dimensions).
		 * @param	Height	The desired height of the emitter.
		 */
		public function setSize(Width:uint,Height:uint):void
		{
			width = Width;
			height = Height;
		}
		
		/**
		 * A more compact way of setting the X velocity range of the emitter.
		 * 
		 * @param	Min		The minimum value for this range.
		 * @param	Max		The maximum value for this range.
		 */
		public function setXVelocity(Min:Number=0,Max:Number=0):void
		{
			minVelocity.x = Min;
			maxVelocity.x = Max;
		}
		
		/**
		 * A more compact way of setting the Y velocity range of the emitter.
		 * 
		 * @param	Min		The minimum value for this range.
		 * @param	Max		The maximum value for this range.
		 */
		public function setYVelocity(Min:Number=0,Max:Number=0):void
		{
			minVelocity.y = Min;
			maxVelocity.y = Max;
		}
		
		/**
		 * A more compact way of setting the angular velocity constraints of the emitter.
		 * 
		 * @param	Min		The minimum value for this range.
		 * @param	Max		The maximum value for this range.
		 */
		public function setRotation(Min:Number=0,Max:Number=0):void
		{
			minRotation = Min;
			maxRotation = Max;
		}
		
		
		/**
		 * Called automatically by the game loop, decides when to launch particles and when to "die".
		 */
		override public function update():void
		{
			_timer += FlxG.elapsed;
			if(delay < 0)
			{
				if(_timer > -delay) { kill(); return; }
				if(_sprites[0].exists) return;
				var sl:uint = _sprites.length;
				for(var i:uint = 0; i < sl; i++) emit();
				return;
			}
			while(_timer > delay)
			{
				_timer -= delay;
				emit();
			}
		}
		
		/**
		 * Call this function to reset the emitter (if you used a negative delay, calling this function "explodes" the emitter again).
		 */
		public function restart():void
		{
			if(_sprites == null)
			{
				FlxG.log("ERROR: You must attach sprites to an emitter for it to work.\nSee FlxEmitter.loadSprites() and FlxEmitter.createSprites() for more info.");
				return;
			}
			active = true;
			_timer = 0;
			_particle = 0;
		}
		
		/**
		 * This function can be used both internally and externally to emit the next particle.
		 */
		public function emit():void
		{
			var s:FlxSprite = _sprites[_particle];
			s.reset(x - (s.width>>1) + FlxG.random()*width, y - (s.height>>1) + FlxG.random()*height);
			s.velocity.x = minVelocity.x;
			if(minVelocity.x != maxVelocity.x) s.velocity.x += FlxG.random()*(maxVelocity.x-minVelocity.x);
			s.velocity.y = minVelocity.y;
			if(minVelocity.y != maxVelocity.y) s.velocity.y += FlxG.random()*(maxVelocity.y-minVelocity.y);
			s.acceleration.y = gravity;
			s.angularVelocity = minRotation;
			if(minRotation != maxRotation) s.angularVelocity += FlxG.random()*(maxRotation-minRotation);
			if(s.angularVelocity != 0) s.angle = FlxG.random()*360-180;
			s.drag.x = drag;
			s.drag.y = drag;
			_particle++;
			if(_particle >= _sprites.length)
				_particle = 0;
			s.onEmit();
		}
		
		/**
		 * Call this function to turn off all the particles and the emitter.
		 */
		override public function kill():void
		{
			active = false;
			if(_sprites == null) return;
			var sl:uint = _sprites.length;
			for(var i:uint = 0; i < sl; i++)
				_sprites[i].exists = false;
		}
	}
}
