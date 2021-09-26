import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;


public class MyGdxGame implements ApplicationListener
{
	BitmapFont font;
	SpriteBatch batch;

	@Override
	public void create()
	{
		font = new BitmapFont();
		font.setColor(0,0,0,1);
		font.setScale(3);
		batch = new SpriteBatch();
	}

	@Override
	public void render()
	{        
	    Gdx.gl.glClearColor(1, 1, 1, 1);
	    Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
		batch.begin();
		font.draw(batch, ""+android.os.Build.VERSION.SDK_INT, 400, 400);
		batch.end();
	}

	@Override
	public void dispose()
	{
		batch.dispose();
	}

	@Override
	public void resize(int width, int height)
	{
	}

	@Override
	public void pause()
	{
	}

	@Override
	public void resume()
	{
	}
}
