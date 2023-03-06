import { sum } from '../sum';
  //the describe function is the suite, accepts 2 arguments   (i): description (ii): Method
describe('sum()', () => {
// (it) is an alias of test, it accepts two arguments , (i): is description of what we are expecting (ii): Method
    it('should add 1 and 2 returning 3', () => {
    // expect/assert statement what & to be is the matcher function 
    expect(sum(1, 2)).toBe(3);
    expect(sum(1, 2)).not.toBeGreaterThan(3);
    expect(sum(1, 2)).not.toBeLessThan(3);
  });
});