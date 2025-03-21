package coverage_metrics;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class CoverageMetricsTest {
  @Test
  public void test1() {
    // Test condition i != 0 and j*j < 100
    CoverageMetrics c = new CoverageMetrics();
    assertEquals(0.5, c.f(1, 1), 0.0);
  }

  @Test
  public void test2() {
    // Test condition i == 0 and j*j < 100
    CoverageMetrics c = new CoverageMetrics();
    assertEquals(0.0, c.f(0, 0), 0.0);
  }

  @Test
  public void test3() {
    // Test condition i != 0 and j*j >= 100
    CoverageMetrics c = new CoverageMetrics();
    assertEquals(0.0, c.f(1, 10), 0.0);
  }

}
